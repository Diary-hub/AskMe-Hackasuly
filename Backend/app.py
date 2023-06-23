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


vectorStore = ""


@app.get("/")
def index_get():
    return render_template("loginPage.html")


@app.post("/getEmbeddings")
def getfaces():
    print("GGGGGGGGG")
    resived = request.get_json()
    raw_texts = resived["texts"]
    print(raw_texts)
    # get raw texts
    # raw_texts = getAllTexts(pdf_docs)

    # get chunks
    text_chunks = getChunksOfText(raw_texts)

    # create vectorStore => using embeddings
    vectorStore = getVectorStore(text_chunks)

    if vectorStore is None:
        response = "Error While Creating Embeddings"
    else:
        response = "Created Embeddings"

    reply = {"reply": response}
    return jsonify(reply)


if __name__ == "__main__":
    print(template_dir)
    load_dotenv()
    app.run(host=os.getenv("HOST_IP"), port=os.getenv("PORT_IP"), debug=False)
