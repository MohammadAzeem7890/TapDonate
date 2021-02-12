import 'package:flutter/material.dart';

import 'CustomButton.dart';

class OnBoardingSliderButtons extends StatelessWidget {

  Color color;
  OnBoardingSliderButtons({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: CustomButton(
        onPressed: (){

        },
        height: 10,
        color: color,
        width: 10,
      ),
    );
  }
}
