import 'package:tap_donate/AddNewNgo.dart';
import 'package:tap_donate/SharedPref.dart';
import 'package:tap_donate/categories.dart';
import 'package:tap_donate/forgotPassword.dart';

import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'LoginPage.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  final images = [
    Image.asset("Images/ngo.png"),
    Image.asset("Images/donationhistory.png"),
    Image.asset("Images/changePass.png"),
    Image.asset("Images/about.png"),
    Image.asset("Images/contactUs.png"),
    Image.asset("Images/logout.png")
  ];

  final title = [
    "NGO's",
    "Donation History",
    "Change Password",
    "About Us",
    "Add Ngo",
    "Logout"
  ];

  final pages = [
    HomePage(),
    Categories(),
    ForgotPassword(),
    HomePage(),
    AddNewNgo(),
    LoginForm()
  ];


  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              Container(
                padding: const EdgeInsets.only(top: 8),
                height: 140,
                child: DrawerHeader(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        "https://venturebeat.com/wp-content/uploads/2018/09/ironman.jpg?w=1200&strip=all",
                        fit: BoxFit.fitHeight,
                        height: 120,
                        width: 60,
                      ),
                    ),
                    title: Text(
                      "Mohammad Azeem",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.edit_outlined,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: title.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(top: 15, left: 15),
                      dense: true,
                      leading: images[index],
                      title: Text(
                        title[index],
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => pages[index]));
                        if(pages[index] == LoginForm()){
                          SharedPref prefs = new SharedPref();
                          prefs.RemoveVisitedUser();
                        }
                      },
                    );
                  },
                ),
              )
            ]),
          ),
        ));
  }
}
