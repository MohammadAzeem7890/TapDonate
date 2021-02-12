import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'SplashScreen.dart';

void main() => runApp(TapDonate());

class TapDonate extends StatefulWidget {
  @override
  _TapDonateState createState() => _TapDonateState();
}

class _TapDonateState extends State<TapDonate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
