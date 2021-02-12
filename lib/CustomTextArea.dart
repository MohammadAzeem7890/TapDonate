import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {

  Color customGreen = new Color(0xff24B58F);
  final TextEditingController controller;
  final String placeholder;
  final Color color;
  final double radius;
  final int maxLines;

  CustomTextArea({this.controller, this.placeholder, this.color, this.radius, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
      child: Container(
        child: TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: new InputDecoration(
            contentPadding: EdgeInsets.only(top: 20, left: 18),
            hintText: placeholder, hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 14),
            filled: true,
            fillColor: color,
            enabledBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: color, width: 1),
            ),
            focusedBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: color, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
