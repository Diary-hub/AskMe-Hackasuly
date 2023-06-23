// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
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
                          hintText:
                              ("                                      ئیمەیڵەکەت داخڵ بکە "),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF119C59),
                            ), // Set your desired color here
                          ),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 28, 127, 252)),
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
                          hintText:
                              ("                                      پاسۆدەکەت داخڵ بکە"),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF119C59),
                            ), // Set your desired color here
                          ),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 28, 127, 252)),
                        ),
                      ),
                    ),
                  ),
                  // login button
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Center(
                      child: SizedBox(
                        width: 210,
                        height: 51,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 236, 236, 236),
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => null),
                              // );
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(top: 9),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      'چوونە ژورەوە',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            )),

                        // sign up
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: InkWell(
                  onTap: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const AboutUs()),
                    // );
                  },
                  child: const Text(
                    " دروست کردنی ئەکاونت",
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
