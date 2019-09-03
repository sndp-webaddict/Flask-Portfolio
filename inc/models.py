from inc import db

class Users(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    fname = db.Column(db.String(50), nullable=False)
    lname = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(50), nullable=False)
    password = db.Column(db.String(70), nullable=False)
    project = db.relationship('Portfolio', backref='users', lazy=True)

class Portfolio(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    portfolio_name = db.Column(db.String(100), nullable=False)
    platform = db.Column(db.String(80), nullable=False)
    portfolio_image = db.Column(db.String(80), nullable=False, default='thumbnail.jpg')
    portfolio_link = db.Column(db.String(100), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)