import 'package:askme/login.dart';
import 'package:flutter/material.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({Key? key}) : super(key: key);

  @override
  State<SignUp_Page> createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? usernameErrorText;
  String? emailErrorText;
  String? passwordErrorText;

  bool validateForm() {
    bool isValid = true;

    if (usernameController.text.isEmpty) {
      setState(() {
        usernameErrorText = 'تکایە ناوەکەت تۆماربکە';
      });
      isValid = false;
    } else {
      setState(() {
        usernameErrorText = null;
      });
    }

    if (emailController.text.isEmpty) {
      setState(() {
        emailErrorText = 'تکایە ئیمەیڵەکەت تۆماربکە';
      });
      isValid = false;
    } else {
      setState(() {
        emailErrorText = null;
      });
    }

    if (passwordController.text.isEmpty) {
      setState(() {
        passwordErrorText = 'تکایە وشەی نهێنی تۆمار بکە';
      });
      isValid = false;
    } else if (passwordController.text.length < 8 ||
        passwordController.text.length > 16) {
      setState(() {
        passwordErrorText = 'وشەی نهێنی پێویستە لە نێوان ٨ و ١٦ کارەکتەربێت';
      });
      isValid = false;
    } else {
      setState(() {
        passwordErrorText = null;
      });
    }

    return isValid;
  }

  void signUp() {
    if (validateForm()) {
      // Perform signup logic here
      // If all fields are valid, proceed with signup process
      // Otherwise, the error messages will be displayed
      // and the user won't be able to proceed until the fields are fixed
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFFAF9F7),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ASKE ME
              Container(
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "لێم بپرسە",
                      style: TextStyle(
                        color: Color(0xFF119C59),
                        fontSize: 48,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
              // login
              Container(
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      " دروستکردنی هەژمار ",
                      style: TextStyle(
                        color: Color(0xFF25282B),
                        fontSize: 32,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),

              // input fields
              Container(
                child: Column(
                  children: [
                    // username
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 30),
                      child: SizedBox(
                        width: 272,
                        height: 55,
                        child: TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: "ناوەکەت داخڵ بکە",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF119C59),
                              ),
                            ),
                            labelStyle: TextStyle(color: Color(0xFF52575C)),
                            errorText: usernameErrorText,
                          ),
                        ),
                      ),
                    ),
                    // email
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 30),
                      child: SizedBox(
                        width: 272,
                        height: 55,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: "ئیمەیڵەکەت داخڵ بکە",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF119C59),
                              ),
                            ),
                            labelStyle: TextStyle(color: Color(0xFF52575C)),
                            errorText: emailErrorText,
                          ),
                        ),
                      ),
                    ),
                    // password
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 30),
                      child: SizedBox(
                        width: 272,
                        height: 55,
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: "پاسۆردەکەت داخڵ بکە",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF119C59),
                              ),
                            ),
                            labelStyle: TextStyle(color: Color(0xFF52575C)),
                            errorText: passwordErrorText,
                          ),
                        ),
                      ),
                    ),
                    // confirm password
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 30),
                      child: SizedBox(
                        width: 272,
                        height: 55,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "دووبارە پاسۆردەکەت داخڵ بکە",
                            filled: true,
                            fillColor: Colors.transparent,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF119C59),
                              ),
                            ),
                            labelStyle: TextStyle(color: Color(0xFF52575C)),
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
                            onPressed: signUp,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 9),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      " دروستکردنی هەژمار",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login_page()),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "  چوونەژورەوە    ",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Color(0xFF52575C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
