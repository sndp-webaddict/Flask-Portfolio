from inc import app, db, hashed
from flask import render_template, redirect, session, flash
from inc.forms import RegisterationForm, LoginForm, ContactForm, Add_Project
from inc.models import Users, Portfolio
from inc.helpers import *

@app.route('/', methods=['GET', 'POST'])
def index():
    title = 'Webaddict | Freelancers'
    contact_form = ContactForm()
    projects = Portfolio.query.order_by(Portfolio.id.desc()).all()
    return render_template('index.html', title=title, form=contact_form, projects=projects)

@app.route('/dashboard')
def dashboard():
    if UserLoggedIn():
        current = current_user()
        return render_template('dashboard/dashboard.html', current=current)
    return redirect('/login')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if not UserLoggedIn():
        form = LoginForm()
        if form.validate_on_submit():
            user = Users.query.filter_by(email=form.email.data).first()
            if user and hashed.check_password_hash(user.password, form.password.data):
                session['user'] = user.id
                flash("You are loggedin successfully", "success")
            else:
                flash("Your details are incorrect. Please contact administrator.", "danger")
                return render_template('dashboard/login.html', form=form)
            return redirect('/dashboard')
        return render_template('dashboard/login.html', form=form)
    return redirect('/dashboard')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if UserLoggedIn():
        form = RegisterationForm()
        if form.validate_on_submit():
            hashed_password = hashed.generate_password_hash(form.password.data)
            user = Users(fname=form.fname.data, lname=form.lname.data, email=form.email.data, password=hashed_password)
            db.session.add(user)
            db.session.commit()
            flash("Account is created successfully","success")
            return redirect('/dashboard')
        return render_template('dashboard/register.html', form=form)
    return redirect('/login')

@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/')

@app.route('/dashboard/projects')
def projects():
    if UserLoggedIn():
        current = current_user()
        projects = Portfolio.query.order_by(Portfolio.id.desc()).all()
        return render_template('dashboard/projects.html', projects=projects, current=current)
    return redirect('/login')

@app.route('/dashboard/add_project', methods=['GET', 'POST'])
def add_project():
    if UserLoggedIn():
        current = current_user()
        form = Add_Project()
        if form.validate_on_submit():
            image = UploadPic(form.portfolio_image.data)
            project = Portfolio(portfolio_name=form.portfolio_name.data, platform=form.platform.data, portfolio_image=image, portfolio_link=form.portfolio_link.data, user_id=current_user().id)
            db.session.add(project)
            db.session.commit()
            flash("Project added Successfully", "success")
            return redirect('/dashboard/add_project')
        return render_template('dashboard/add_project.html', form=form, current=current)
    return redirect('/login')

@app.route('/dashboard/delete/<int:post_id>')
def delete(post_id):
    if UserLoggedIn():
        project = Portfolio.query.filter_by(id=post_id).first()
        db.session.delete(project)
        db.session.commit()
        flash("Project deleted successfully", "success")
        return redirect('/dashboard/projects')
    return redirect('/login')

@app.route('/dashboard/edit/<int:post_id>', methods=['GET', 'POST'])
def edit_project(post_id):
    if UserLoggedIn():
        current = current_user()
        form = Add_Project()
        project = Portfolio.query.filter_by(id=post_id).first()
        if form.validate_on_submit():
            if form.portfolio_image.data:
                image = UploadPic(form.portfolio_image.data)
                project.portfolio_image = image
            project.portfolio_name = form.portfolio_name.data
            project.platform = form.platform.data
            project.portfolio_link = form.portfolio_link.data
            db.session.commit()
            flash("Project updated Successfully", "success")
            return redirect('/dashboard/projects')
        else:
            form.portfolio_name.data = project.portfolio_name
            form.platform.data = project.platform
            form.portfolio_link.data = project.portfolio_link
        return render_template('dashboard/add_project.html', form=form, current=current)
    return redirect('/login')


@app.errorhandler(404)
def error_404(error):
    return render_template('/errors/404.html'), 404