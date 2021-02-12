
import 'package:flutter/material.dart';
import 'package:tap_donate/CustomAppBar.dart';
import 'package:tap_donate/CustomButton.dart';
import 'package:tap_donate/CustomTextField.dart';
import 'package:tap_donate/ForgotPasswordModel.dart';
import 'package:tap_donate/Network.dart';

import 'LoginPage.dart';


class ForgotPassword extends StatelessWidget {
  Color custom = new Color(0xff24B58F);

  TextEditingController email = new TextEditingController();
  TextEditingController newPassword = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomAppBar(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginForm()));
            },
            title: "new Password".toUpperCase(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: CustomTextField(
                  controller: email,
                  placeholder: "Email",
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CustomTextField(
                  controller: newPassword,
                  placeholder: "New Password",
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CustomTextField(
                  controller: confirmPassword,
                  placeholder: "Confirm Password",
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13, bottom: 9),
                child: CustomButton(
                  onPressed: () {
                    if(email.text == null || newPassword.text == null || confirmPassword.text == null){
                      print('invalid data');
                    }
                    else if(newPassword.text == confirmPassword.text){
                      Network.updatePassword(ForgotPasswordModel(email: email.text, password: confirmPassword.text));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginForm()));
                    }
                    else{
                      print('invalid data');
                    }
                  },
                  value: "Submit".toUpperCase(),
                  color: custom,
                  txtColor: Colors.white,
                  height: 45,
                  width: 290,
                  fontSize: 19,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
