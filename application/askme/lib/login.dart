// ignore_for_file: avoid_unnecessary_containers

import 'package:askme/my_button.dart';
import 'package:askme/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login_page extends StatefulWidget {
  Login_page({super.key});
  //controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

// sign user in method
  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        print("no");
      } else if (e.code == 'wrong-password') {
        print('wrong pass');
      }
    }
  }

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  get signUserIn => null;

  @override
  Widget build(BuildContext context) {
    //  double screenwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFFAF9F7),
        body: Column(
          children: [
            // ASKE ME
            Container(
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text("لێم بپرسە",
                    style: TextStyle(
                      color: Color(0xFF119C59),
                      fontSize: 48,
                      fontFamily: 'Montserrat',
                    )),
              )),
            ),
            // login
            Container(
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text("چوونە ژورەوە ",
                    style: TextStyle(
                      color: Color(0xFF25282B),
                      fontSize: 32,
                      fontFamily: 'Montserrat',
                    )),
              )),
            ),

            // input fields
            Container(
              child: Column(
                children: [
                  // email
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 30),
                    child: SizedBox(
                      width: 272,
                      height: 55,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          labelText:
                              ("                                      ئیمەیڵەکەت داخڵ بکە "),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF119C59),
                            ), // Set your desired color here
                          ),
                          labelStyle: TextStyle(color: Color(0xFF52575C)),
                        ),
                      ),
                    ),
                  ),
                  //password
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 30),
                    child: SizedBox(
                      width: 272,
                      height: 55,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          labelText:
                              ("                                      پاسۆدەکەت داخڵ بکە"),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF119C59),
                            ), // Set your desired color here
                          ),
                          labelStyle: TextStyle(color: Color(0xFF52575C)),
                        ),
                      ),
                    ),
                  ),
                  // login button
                  My_Button(
                    onTap: signUserIn,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUp_Page()),
                    );
                  },
                  child: const Text(
                    " دروستکردنی هەژمار",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                        color: Color(0xFF52575C),
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
