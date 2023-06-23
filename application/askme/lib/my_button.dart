import 'package:flutter/material.dart';

class My_Button extends StatelessWidget {
  final Function()? onTap;
  const My_Button({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Column(
            children: [
              Center(
                child: Text(
                  'چوونە ژورەوە',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
