import 'package:flutter/material.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

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
                      color: const Color(0xFF119C59),
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
                      color: const Color(0xFF25282B),
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
                    padding: EdgeInsets.only(top: 15, right: 30),
                    child: Container(
                      width: 272,
                      height: 55,
                      color: Color.fromARGB(255, 235, 235, 235),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 218, 146, 0),
                          hintText: "",
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 28, 127, 252)),
                        ),
                      ),
                    ),
                  ),

                  // Column(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(top: 40, left: 200),
                  //       child: Text(
                  //         "ئیمەیڵەکەت داخڵ بکە ",
                  //         style: TextStyle(
                  //           fontSize: 17,
                  //           fontFamily: 'Montserrat',
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // password
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
