import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tap_donate/OnBoardingReal.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //int _key = int.parse(prefs.getString("user_id")) ?? 0;
    if (prefs.getString('user_id') != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnBoardingReal()));
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(seconds: 3), () {
      check();
    });
  }
  Color customGreen = new Color(0xff24B58F);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("Images/logo.png"),
            ),
          ),
          Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: new TextSpan(
                    text: 'Kuick ',
                    style:TextStyle(color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      new TextSpan(
                          text: 'Pay',
                          style: new TextStyle(fontWeight: FontWeight.bold, color: customGreen, fontSize: 30)),
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
