# from flask import Flask, app, render_template, request

# app = Flask(__name__)

# if __name__ == "__main__":
#     app.run(debug=True)

import os

from flask import Flask, render_template, request


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
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
        members = [
            {"name": "Arleta", "surname": "Marleta", "image": "/static/img/arleta.png", "instrument": "gitara", "fact": "Nie lubię słodyczy"},
            {"name": "Marek", "surname": "Tralek", "image": "/static/img/marek.png", "instrument": "perkusja", "fact": "Nigdy niczego nie złamałem"},
            {"name": "Karol", "surname": "Barol", "image": "/static/img/karol.png", "instrument": "wokal", "fact": "Pochodzę z Hiszpanii"},
        ]
        return render_template("members.html", request=request, members=members)

    @app.route("/discography")
    def discography():
        albums = [
            {"id": "1", "title": "Nie ma letko", "year": "2021", "image": "/static/img/album1.png"},
            {"id": "2", "title": "Kiedyś to było", "year": "2020", "image": "/static/img/album2.jpg"},
        ]
        return render_template("discography.html", request=request, albums=albums)
    
    from . import db
    db.init_app(app)

    return app