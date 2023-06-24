// ignore: unused_import
import 'package:askme/chat.dart';
// ignore: unused_import
import 'package:askme/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'لێم بپرسە',
            home: Login_page(),

            // home: Login_page(),
          );
        }

        // Display a loading indicator while Firebase initializes
        return const CircularProgressIndicator();
      },
    );
  }
}
