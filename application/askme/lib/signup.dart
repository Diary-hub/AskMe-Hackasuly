import 'package:askme/login.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void signUserIn() async {
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // Account created successfully, you can perform any additional actions here
      } else {
        displaySnackBar(' پاسۆردەکەت دەبێت یەکسان بێت');
      }
    } catch (e) {
      String errorMessage = 'هەڵەیەک ڕوویدا، تکایە دوبارە هەوڵبدەرەوە';
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = 'ئەم ئیمەیڵە بەکارهێناوەتەوە لە سەر هەژمارێکی تر';
            break;
          case 'invalid-email':
            errorMessage = 'ئیمەیڵەکە نادروستە';
            break;
          case 'weak-password':
            errorMessage = 'وشەی نهێنی ناسنەکەوتە';
            break;
        }
      }
      displaySnackBar(errorMessage);
    }
  }

  void displaySnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  bool validateForm() {
    bool isValid = _formKey.currentState?.validate() ?? false;
    return isValid;
  }

  void signUp() {
    if (validateForm()) {
      signUserIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFFAF9F7),
          body: ListView(
            children: [
              Container(
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      " ! لێم بپرسە",
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
                      " دروستکردنی هەژمار",
                      style: TextStyle(
                        color: Color(0xFF119C59),
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 50,
                        right: 50,
                      ),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ناوی بەکارهێنەر',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'تکایە ناوی بەکارهێنەر بنووسە';
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
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 50,
                        right: 50,
                      ),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'دڵنیابکەرەوەی وشەی نهێنی',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'تکایە دڵنیابکەرەوەی وشەی نهێنی بنووسە';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Set the desired radius here
                            ),
                            backgroundColor: const Color(0xFF119C59)),
                        onPressed: signUp,
                        child: const Text(
                          'خۆتۆمارکردن',
                          style: TextStyle(fontSize: 23),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login_page(),
                          ),
                        );
                      },
                      child: const Text(
                        "چوونەژورەوە",
                        style: TextStyle(
                          color: Color(0xFF119C59),
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SignUpPage(),
  ));
}
