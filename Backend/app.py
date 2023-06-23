from flask import Flask, render_template, request, jsonify
from flask_cors import CORS
from dotenv import load_dotenv
from functions import *
import sys
import os


template_dir = os.path.abspath("FrontEnd/pages")
static_dir = os.path.abspath("FrontEnd/src")
app = Flask(__name__, template_folder=template_dir, static_folder=static_dir)
CORS(app)


@app.get("/")
def index_get():
    return render_template("loginPage.html")


@app.route("/WhoIsIt", methods=["GET", "POST"])
def getfaces():
    text = request.get_json()
    response = Recognize(text["message"])
    reply = {"answer": response}
    return jsonify(reply)
    os.getenv("GCP_PROJECT_ID")


if __name__ == "__main__":
    print(template_dir)
    load_dotenv()
    app.run(host=os.getenv("HOST_IP"), port=os.getenv("PORT_IP"), debug=False)
