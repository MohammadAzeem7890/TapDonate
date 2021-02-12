import 'package:flutter/material.dart';

class OnBoardingSlider extends StatelessWidget {

  Color customGreen = new Color(0xff24B58F);
  final String imageName;
  OnBoardingSlider({@required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 80),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Image.asset(imageName),
    );
  }
}
