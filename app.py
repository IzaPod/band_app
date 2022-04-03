from flask import Flask, app, render_template, request

app = Flask(__name__)

@app.route("/")
def index():
    user = {"username": "Zenek"}
    return render_template("index.html", user=user, request=request)

@app.route("/about")
def about():
    return render_template("about.html", request=request)

@app.route("/members")
def members():
    return render_template("members.html", request=request)

@app.route("/discography")
def discography():
    return render_template("members.html", request=request)

@app.route("/concerts")
def concerts():
    return render_template("members.html", request=request)

if __name__ == "__main__":
    app.run(debug=True)

