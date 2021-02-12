import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  Color customGreen = new Color(0xff24B58F);
  final TextEditingController controller;
  final String placeholder;
  final Color color;
  final double height;

  CustomTextField({this.controller, this.placeholder, this.color, this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: height,
        child: TextField(
          controller: controller,
          decoration: new InputDecoration(
              contentPadding: const EdgeInsets.only(top: 25, left: 30),
              filled: true,
              fillColor: color,
              hintText: placeholder, hintStyle: TextStyle(color: customGreen),
              enabledBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: customGreen, width: 1),
              ),
              focusedBorder: new OutlineInputBorder(
                borderSide: BorderSide(color: customGreen, width: 1),
                borderRadius: BorderRadius.circular(50),
              )
          ),
        ),
      ),
    );
  }
}
