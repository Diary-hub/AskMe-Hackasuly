import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:askme/signup.dart';
import 'package:askme/my_button.dart';

class Login_page extends StatefulWidget {
  Login_page({Key? key}) : super(key: key);

  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void signUserIn() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage = '';
        if (e.code == 'user-not-found') {
          errorMessage = 'Invalid email';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Invalid password';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFFAF9F7),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
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
              Container(
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "چوونە ژورەوە ",
                      style: TextStyle(
                        color: Color(0xFF25282B),
                        fontSize: 32,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 30),
                      child: SizedBox(
                        width: 272,
                        height: 55,
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText:
                                "                                      ئیمەیڵەکەت داخڵ بکە ",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF119C59),
                              ),
                            ),
                            labelStyle: TextStyle(color: Color(0xFF52575C)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'تکایە ئیمەیڵێک داخڵ بکە';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 30),
                      child: SizedBox(
                        width: 272,
                        height: 55,
                        child: TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText:
                                "                                      پاسۆدەکەت داخڵ بکە",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF119C59),
                              ),
                            ),
                            labelStyle: TextStyle(color: Color(0xFF52575C)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'تکایە وشەینهێنی داخڵ بکە';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // sign in

              My_Button(
                onTap: () {
                  signUserIn();
                },
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
                      fontWeight: FontWeight.bold,
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
