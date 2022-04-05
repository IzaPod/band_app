from flask import Flask, app, render_template, request

app = Flask(__name__)

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
    return render_template("members.html", request=request)

@app.route("/concerts")
def concerts():
    return render_template("members.html", request=request)

if __name__ == "__main__":
    app.run(debug=True)

