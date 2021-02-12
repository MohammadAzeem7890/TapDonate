import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tap_donate/CustomButton.dart';
import 'package:tap_donate/CustomTextField.dart';
import 'LoginPage.dart';
import 'Network.dart';
import 'User.dart';

class RegisterationForm extends StatelessWidget {
  Color custom = new Color(0xff24B58F);

  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  String massage = "";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: custom,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    "Images/logo.png",
                    height: 20,
                  ),
                ),
              ),
              Text(massage, style: TextStyle(color: Colors.white, fontSize: 20),),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: CustomTextField(
                  placeholder: "Username",
                  controller: username,
                  color: Colors.white,
                ),
              ),
              CustomTextField(
                placeholder: "Email",
                controller: email,
                color: Colors.white,
              ),
              CustomTextField(
                placeholder: "Contact",
                controller: password,
                color: Colors.white,
              ),
              CustomTextField(
                placeholder: "Password",
                controller: confirmPassword,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(top: 17),
                child: CustomButton(
                  onPressed: () {
                    Network.signUp(User(userName: username.text,userEmail: email.text,userNumber: confirmPassword.text,userPassword: password.text));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginForm()));
                  },
                  height: 45,
                  width: 280,
                  color: custom,
                  txtColor: Colors.white,
                  value: "sign up".toUpperCase(),
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, bottom: 15),
                child: CustomButton(
                  height: 30,
                  width: 235,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginForm()));
                  },
                  value: "Already have an account? Sign up",
                  txtColor: custom,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
