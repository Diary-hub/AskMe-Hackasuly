import 'package:flutter/material.dart';

class mytext extends StatelessWidget {
  final controller;

  const mytext({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          labelText:
              ("                                      ئیمەیڵەکەت داخڵ بکە "),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF119C59),
            ),
          ),
          labelStyle: TextStyle(color: Color(0xFF52575C)),
        ),
      ),
    );
  }
}


  // Padding(
  //                   padding: const EdgeInsets.only(top: 20, right: 30),
  //                   child: SizedBox(
  //                     width: 272,
  //                     height: 55,
  //                     child: TextFormField(
  //                       controller: passwordController,
  //                       decoration: InputDecoration(
  //                         filled: true,
  //                         fillColor: Colors.transparent,
  //                         labelText:
  //                             ("                                      پاسۆدەکەت داخڵ بکە"),
  //                         floatingLabelBehavior: FloatingLabelBehavior.auto,
  //                         enabledBorder: UnderlineInputBorder(
  //                           borderSide: BorderSide(
  //                             color: Color(0xFF119C59),
  //                           ),
  //                         ),
  //                         labelStyle: TextStyle(color: Color(0xFF52575C)),
  //                       ),
  //                     ),
  //                   ),
  //                 ),