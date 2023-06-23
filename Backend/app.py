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
conversation = ""


@app.get("/")
def index_get():
    return render_template("loginPage.html")


@app.post("/getEmbeddings")
async def getEmbeddings():
    resived = request.get_json()
    raw_texts = resived["texts"]
    user_question = resived["question"]

    # get raw texts
    # raw_texts = getAllTexts(pdf_docs)

    # get chunks
    text_chunks = await getChunksOfText(raw_texts)

    # create vectorStore => using embeddings
    vectorStore = await getVectorStore(text_chunks)

    # getting answer
    conversation = await getConversationChain(vectorStore)

    answer = await getAnswer(user_question)

    if vectorStore is None:
        response = "Error While Creating Embeddings"
    else:
        response = "Created Embeddings"
    print(conversation, "")
    print(response)
    print(vectorStore)
    print(conversation)
    print(answer)
    print(conversation)

    reply = {"reply": response}
    # , "embedding": vectorStore
    return jsonify(reply)


if __name__ == "__main__":
    print(template_dir)
    load_dotenv()
    app.run(host=os.getenv("HOST_IP"), port=os.getenv("PORT_IP"), debug=False)
