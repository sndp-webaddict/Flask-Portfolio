from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
import os
from inc.config import Config

app = Flask(__name__)
app.config.from_object(Config)

db = SQLAlchemy(app)
hashed = Bcrypt(app)

from inc import routes