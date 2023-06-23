import 'package:askme/test.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class My_Button extends StatelessWidget {
  final Function()? onTap;
  const My_Button({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 115),
          decoration: BoxDecoration(
              color: Color(0xFF119C59),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Column(
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Test()),
                      );
                    },
                    child: const Text(
                      'چوونە ژورەوە',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // child: Text(
                  //   'چوونە ژورەوە',
                  //   style: TextStyle(
                  //       color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
