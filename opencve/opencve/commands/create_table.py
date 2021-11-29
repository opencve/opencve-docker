from opencve.extensions import db
from opencve.app import app
import datetime

import click
from flask import current_app as app
from flask.cli import with_appcontext
from sqlalchemy.exc import IntegrityError

from opencve.commands import ensure_config, error, info
@click.command()
@click.argument("doit")
@ensure_config
@with_appcontext
def create_table(doit):
    with app.app_context():
        db.create_all()