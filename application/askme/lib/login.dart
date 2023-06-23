import 'package:askme/test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:askme/signup.dart';

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

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
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            )
            .then((value) => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Test(),
                      ))
                });
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
    double screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Center(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFFAF9F7),
          body: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "! لێم بپرسە",
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
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 50,
                          right: 50,
                        ),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'ئیمەیڵ',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'تکایە ئیمەیڵەکەت بنووسە';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 50,
                          right: 50,
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'وشەی نهێنی',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'تکایە وشەی نهێنی بنووسە';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // sign in

                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          signUserIn();
                        },
                        child: Container(
                          width: screenwidth * 0.5,
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color(0xFF119C59),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                              child: Text(
                            "چونەژورەوە",
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                //
                //
                //
                //
                //
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " دروستکردنی هەژمار",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF52575C),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
