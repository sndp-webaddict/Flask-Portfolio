from flask import session
import secrets
import os
from inc import app
from inc.models import Users

def UserLoggedIn():
    if 'user' in session and session['user'] != '':
        return True

def current_user():
    user = Users.query.filter_by(id=session['user']).first()
    return user

def UploadPic(profile_pic):
    random_hex = secrets.token_hex(8)
    _, file_e = os.path.splitext(profile_pic.filename)
    pic_name = random_hex + file_e
    picture_path = os.path.join(app.root_path, 'static/backend/img', pic_name)
    profile_pic.save(picture_path)
    return pic_name