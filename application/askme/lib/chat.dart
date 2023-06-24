import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Message.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class MessagingScreen extends StatefulWidget {
  const MessagingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  List<Message> messages = [];

  final TextEditingController msg = TextEditingController();

  Future uploadFile() async {
    String responce = '';
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");

      // String fileName = file.path.split('/').last;
      String filePath = file.path;

      await getText(filePath).then((value) => {
            setState(() {
              responce = value;
            })
          });
    }

    return responce;
  }

  Future getText(String path) async {
    //Load an existing PDF document.
    final PdfDocument document =
        PdfDocument(inputBytes: File(path).readAsBytesSync());
//Extract the text from all the pages.
    String text = PdfTextExtractor(document).extractText();
//Dispose the document.
    document.dispose();
    return text;
  }

  void sendMessage(String question) async {
    if (question == '') {
      return;
    }
    String texts = '';
    String msggg = '';

    await uploadFile().then((value) => {
          setState(() {
            texts = value;
          })
        });

    // Code to send the user's question to the server using API and receive a response
    // Assuming the response is stored in a variable called 'response'
    await sendRequest(texts, question).then((value) => {msggg = value});

    setState(() {
      messages
          .add(Message('User', question)); // Add user's question to the list
      messages
          .add(Message('Server', msggg)); // Add server's response to the list
      msg.clear();
    });
  }

  Future<String> sendRequest(String texts, String question) async {
    var url = Uri.parse(
        'http://10.147.17.49:5000/getEmbeddings'); // Replace with your API endpoint URL

    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'texts': texts, 'question': question});

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      // API call was successful
      var jsonResponse = jsonDecode(response.body);
      var reply = jsonResponse['reply'];
      print(reply);

      return reply;
    } else {
      // API call failed
      throw Exception('Failed to send request. Status code: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 230, 230),
      appBar: AppBar(
        backgroundColor: const Color(0xFF119C59),
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(children: [
            TextSpan(
                text: 'لێم بپرسسە !',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            TextSpan(text: '\n'),
            TextSpan(
              text: "نیم GPT من 😉",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ]),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: message.sender == 'User'
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (message.sender == 'User')
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              message.content,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      if (message.sender != 'User')
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(message.content),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          TextField(
            controller: msg,
            onSubmitted: sendMessage,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              hintText: 'نامەکەت لێرە بنووسە',
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    30), // Set the border radius to make the corners round
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  // Code to send the message
                  sendMessage(msg.text);
                },
                icon: const Icon(Icons.send),
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
