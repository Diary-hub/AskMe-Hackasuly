const chatHolder = document.querySelector("#chatHolder");
const uploadBTN = document.querySelector("#uploadBTN");
const sendBTN = document.querySelector("#sendBTN");
const selectBTN = document.querySelector("#selectBTN");
const areaText = document.querySelector("#areaText");

function botTemplate(chat) {
  temp =
    '<div class="d-flex justify-content-start mb-4">' +
    '<div class="msg_cotainer">' +
    chat +
    "</div>" +
    "</div>";

  return temp;
}

function userTemplate(chat) {
  temp =
    '<div class="d-flex justify-content-end mb-4">' +
    '<div class="msg_cotainer_send">' +
    chat +
    "</div>" +
    "</div>";

  return temp;
}

let allText = "";
async function extractText(url, pass) {
  let pdf;
  pdf = await pdfjsLib.getDocument(url).promise;
  //  console.log(pdf);
  let pages = pdf.numPages;
  // console.log(pages);
  for (let i = 1; i <= pages; i++) {
    let page = await pdf.getPage(i);
    let txt = await page.getTextContent();
    let text = txt.items.map((s) => s.str).join("");
    // console.log(text);
    allText += text;
  }

  console.log(allText);
  return true;
}

async function getResponce(questions) {
  await fetch("http://10.147.17.49:5000/getEmbeddings", {
    method: "POST",
    body: JSON.stringify({ texts: allText, question: questions }),
    mode: "cors",
    headers: {
      "Content-Type": "application/json",
    },
  })
    .then((r) => r.json())
    .then((r) => {
      prevContent = r.reply;
      chatHolder.innerHTML += botTemplate(prevContent);
    })
    .catch((error) => {
      alert("Error:", error);
    });
}

async function sendMessage() {
  // console.log(areaText.value);

  if (allText == "" || allText == " ") {
    alert("تکایە فایلی پی دی ئیف دابنێ");
    return;
  } else {
    if (areaText.value == "" || areaText.value == " ") {
      alert("تکایە، نوسین با هەبێت");

      return;
    }
    chatHolder.innerHTML += userTemplate(areaText.value);
    await getResponce(areaText.value);
    areaText.value = "";
  }
}

async function uploadFile() {
  let file = selectBTN.files[0];
  if (file != undefined && file.type == "application/pdf") {
    let fr = new FileReader();
    fr.readAsDataURL(file);
    fr.onload = () => {
      let res = fr.result;
      if (extractText(res, false)) {
        alert("لێم بپرسە!، ئامادیە، دەوانینت قسە بکەیت");
      }
    };
  } else {
    alert("ببورە هیچ فایلێک ئەپڵۆد نەبووە");
  }
}

uploadBTN.addEventListener("click", uploadFile);
sendBTN.addEventListener("click", sendMessage);
