import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_donate/CustomButton.dart';
import 'package:tap_donate/CustomTextArea.dart';
import 'package:tap_donate/Donate.dart';
import 'package:tap_donate/DonationOrganizations.dart';
import 'package:tap_donate/Network.dart';
import 'package:tap_donate/User.dart';
import 'package:tap_donate/categories.dart';

import 'AddDonatioModel.dart';


class SearchCatergories extends StatefulWidget {

  @override
  SearchCatergoriesState createState() => SearchCatergoriesState();
}

class SearchCatergoriesState extends State<SearchCatergories> {

  TextEditingController description = new TextEditingController();
  TextEditingController location = new TextEditingController();

  Color customGreen = new Color(0xff24B58F);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 110,
                width: double.infinity,
                color: customGreen,
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, right: 22),
                        child: Container(
                          height: 30,
                          width: 35,
                          child: FlatButton(
                            color: Colors.transparent,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 50, left: 35, right: 30, bottom: 10),
                      child: TextField(
                        style: TextStyle(color: customGreen),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.search,
                              color: customGreen,
                              size: 20,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: customGreen,
                            fontSize: 17,
                          ),
                          enabledBorder: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: customGreen)),
                          focusedBorder: new OutlineInputBorder(
                              borderSide: BorderSide(color: customGreen),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: customGreen, width: 1),
                        ),
                        margin: const EdgeInsets.only(
                            top: 50, left: 30, right: 30),
                        child: DonationOrganizations(),
                      ),
                      CustomTextArea(
                        controller: description,
                        color: customGreen,
                        placeholder: "description".toUpperCase(),
                        maxLines: 10,
                        radius: 15,
                      ),
                      CustomTextArea(
                        controller: location,
                        placeholder: "pick-up location".toUpperCase(),
                        color: customGreen,
                        radius: 15,
                        maxLines: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
                        child:  CustomButton(
                          onPressed: () async{
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            //int user_id = int.parse(prefs.getString("user_email")) ?? 0;
                            //  int ngo_Id = int.parse(GetNgoId.ngoId.name);
                            User user = new User();
                            CategoriesState category = new CategoriesState();
                            //int user_id = int.parse(prefs.getString("user_id"));
                            //int categroy_id = int.parse(category.titles.length.toString()) ?? 0;
                            //  print(ngo_Id);
                            print(prefs.getInt("ngo_id"));
                            //print(user_id);
                            print(prefs.getInt("category_Id"));
                            print(prefs.getString("user_Id"));
                            int category_Id = prefs.getInt("category_Id");
                            String user_Id = prefs.getString("user_Id");
                            Network.addDonation(AddDonation(ngoId: prefs.getInt("ngo_id"), userId: user_Id , categoryId: category_Id, description: description.text, pickUpLocation: location.text ));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Donate()));
                          },
                          color: customGreen,
                          fontWeight: FontWeight.w500,
                          value: "Submit".toUpperCase(),
                          txtColor: Colors.white,
                          width: 300,
                          height: 45,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}