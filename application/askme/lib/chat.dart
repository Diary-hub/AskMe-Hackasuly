import 'package:flutter/material.dart';
import 'Message.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class MessagingScreen extends StatefulWidget {
  const MessagingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  List<Message> messages = [];

  void sendMessage(String text) {
    // Code to send the user's question to the server using API and receive a response
    // Assuming the response is stored in a variable called 'response'
    String response = 's';

    setState(() {
      messages.add(Message('User', text)); // Add user's question to the list
      messages.add(
          Message('Server', response)); // Add server's response to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messaging App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(message.sender),
                  subtitle: Text(message.content),
                );
              },
            ),
          ),
          TextField(
            onSubmitted: sendMessage,
            decoration: const InputDecoration(
              hintText: 'Type your message',
            ),
          ),
        ],
      ),
    );
  }
}
