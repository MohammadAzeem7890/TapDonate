import 'package:flutter/material.dart';

class DonateFieldLabels extends StatelessWidget {
  @override
  final String label;
  DonateFieldLabels({this.label});
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 15, left: 30),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(label, style: TextStyle(
            fontSize: 12,
            color: Colors.black54
        ),),
      ),
    );
  }
}
