
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_donate/CustomButton.dart';
import 'package:tap_donate/CustomTextField.dart';
import 'package:tap_donate/LoginResultModel.dart';
import 'package:tap_donate/RegisterationForm.dart';
import 'package:tap_donate/SharedPref.dart';
import 'package:tap_donate/User.dart';
import 'package:tap_donate/forgotPassword.dart';
import 'package:tap_donate/loginModel.dart';

import 'HomePage.dart';
import 'Network.dart';

class LoginForm extends StatelessWidget {
  Color customGreen = new Color(0xff24B58F);

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  AlertDialogueBox(String text){
    return AlertDialog(
      title: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                    bottomLeft: Radius.circular(80)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Image.asset(
                  "Images/logo.png",
                  height: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: CustomTextField(
                controller: email,
                placeholder: "Email",
                color: Colors.white,
              ),
            ),
            CustomTextField(
              controller: password,
              placeholder: "Password",
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomButton(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  // SharedPref prefs = new SharedPref();
                    var res = Network.logIn(LoginModel(email: email.text, password: password.text)).then((value) => {
                    prefs.setString("email", value.user.userEmail),
                    //prefs.setBool(value.user.userId, true),
                    prefs.setString("user_Id", value.user.userId),
                    prefs.setString("user_name", value.user.userName),
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()))
                  });
                  // prefs.key = email.text;
                  // prefs.setVisitingFlag();

                },
                height: 45,
                width: 285,
                color: customGreen,
                txtColor: Colors.white,
                value: "login".toUpperCase(),
                fontWeight: FontWeight.w600,
                fontSize: 19,
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()));

              },
              child: Text(
                "Forgot your password?",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 10),
              child: CustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterationForm()));
                },
                height: 33,
                width: 250,
                color: Colors.white,
                txtColor: customGreen,
                value: "Don't have an account? Sign up",
              ),
            )
          ],
        ),
      ),
    );
  }
}
