import os

from flask import Flask, render_template, request, abort
from app.db import get_db

def page_not_found(e):
    return render_template('404.html'), 404

def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'band_app.sqlite'),
    )
    app.register_error_handler(404, page_not_found)

    if test_config is None:
        app.config.from_pyfile('config.py', silent=True)
    else:
        app.config.from_mapping(test_config)

    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    @app.route("/")
    def index():
        return render_template("index.html", request=request)

    @app.route("/about")
    def about():
        return render_template("about.html", request=request)

    @app.route("/members")
    def members():
        db = get_db()
        members = db.execute('SELECT * FROM members ORDER BY id ASC').fetchall()
        return render_template("members.html", request=request, members=members)

    @app.route("/discography")
    def discography():
        db = get_db()
        albums = db.execute('SELECT * FROM albums ORDER BY year_published DESC').fetchall()
        return render_template("discography.html", request=request, albums=albums)
    
    @app.route("/discography/<int:album_id>")
    def album(album_id):
        db = get_db()
        
        album = db.execute('SELECT * FROM albums WHERE id=?', (album_id,)).fetchall()
        if not album:
            abort(404)

        songs = db.execute('SELECT * FROM songs WHERE album_id=? ORDER BY id ASC', (album_id,)).fetchall()
        return render_template("album.html", request=request, album=album[0], songs=songs)
    
    @app.route("/tech")
    def technical():
        return render_template("technical.html", request=request)


    from . import db
    db.init_app(app)

    return app