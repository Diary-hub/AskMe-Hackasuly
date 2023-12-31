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
def loginPage_get():
    return render_template("loginPage.html")


@app.get("/chat")
def chatPage_get():
    return render_template("chat.html")


@app.get("/aboutus")
def aboutUsPage_get():
    return render_template("AboutUs.html")


@app.get("/register")
def signupPage_get():
    return render_template("signUp.html")


@app.get("/home")
def homePage_get():
    return render_template("home.html")


@app.post("/fileTest")
def getFileTest():
    resived = request.get_json()
    raw_texts = resived["file"]
    raw_texts2 = resived["data"]

    if raw_texts is not None or raw_texts2 is not None:
        reply = {"workingState": "Done"}
    else:
        reply = {"workingState": "Not Done"}

    return jsonify(reply)


@app.post("/getEmbeddings")
def getEmbeddings():
    resived = request.get_json()
    raw_texts = resived["texts"]
    user_question = resived["question"]
    user_question = transtlate(user_question, sc="en")

    # get raw texts
    # raw_texts = getAllTexts(pdf_docs)

    # get chunks
    text_chunks = getChunksOfText(raw_texts)

    # create vectorStore => using embeddings
    vectorStore = getVectorStore(text_chunks)

    # getting answer
    conversation = getConversationChain(vectorStore)

    answer = getAnswer(user_question, conversation)
    chat_history = answer
    for i, msg in enumerate(chat_history):
        if i % 2 == 0:
            print("User: \n", msg.content)
            st.write(
                # user_template.replace("{{MSG}}", msg.content), unsafe_allow_html=True
            )
        else:
            chat_info = msg.content
            print("AI: \n", msg.content)

            st.write(
                # bot_template.replace("{{MSG}}", msg.content), unsafe_allow_html=True
            )

    if vectorStore is None:
        response = "Error While Creating Embeddings"
    else:
        response = "Created Embeddings"
    # print("this is first conv \n", conversation)
    # print("this is the responce \n", response)
    # print("this is the vectorStore \n", vectorStore)
    # print("this is middle conv \n", conversation)
    # print("this is the answer \n", answer)
    # print("this is last conv \n", conversation)

    reply = {"workingState": response, "reply": transtlate(chat_info, sc="ckb")}
    # , "embedding": vectorStore
    return jsonify(reply)


if __name__ == "__main__":
    print(template_dir)
    load_dotenv()
    app.run(host=os.getenv("HOST_IP"), port=os.getenv("PORT_IP"), debug=False)
