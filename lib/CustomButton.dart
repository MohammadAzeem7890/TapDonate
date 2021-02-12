import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {

  Color customGreen = new Color(0xff24B58F);

  final GestureTapCallback onPressed;
  final String value;
  final Color color;
  final FontWeight fontWeight;
  final double width;
  final double height;
  final Color txtColor;
  final double fontSize;

  CustomButton({@required this.onPressed, this.value, this.color, this.fontWeight, this.height, this.width, this.txtColor, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: FlatButton(
        onPressed: onPressed,
        color: color,
        child: Text(value.toString(), style: TextStyle(color: txtColor, fontSize: fontSize, fontWeight: fontWeight),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
      ),
    );
  }
}
