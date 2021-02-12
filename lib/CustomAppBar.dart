import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  Color customGreen = new Color(0xff24B58F);

  final GestureTapCallback onPressed;
  final String title;

  CustomAppBar({@required this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: PreferredSize(
      preferredSize: Size(double.infinity, 100),
      child: AppBar(
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20,),
            onPressed: onPressed,
          ),
        ),
        backgroundColor: customGreen,
        title: Padding(
          padding: const EdgeInsets.only(top: 25, right: 70),
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    ));
  }
}
