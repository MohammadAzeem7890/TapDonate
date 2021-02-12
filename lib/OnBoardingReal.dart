import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tap_donate/CustomButton.dart';
import 'package:tap_donate/HomePage.dart';
import 'package:tap_donate/OnBoardingSlider.dart';
import 'package:tap_donate/OnBoardingSliderButtons.dart';
import 'package:tap_donate/RegisterationForm.dart';


class OnBoardingReal extends StatefulWidget {
  @override
  _OnBoardingRealState createState() => _OnBoardingRealState();
}

class _OnBoardingRealState extends State<OnBoardingReal> {

  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;

  Color customGreen = new Color(0xff24B58F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customGreen,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
                Container(
                  height: 450,
                  child: PageView(
                    onPageChanged: (index){
                      setState(() {
                        pageChanged = index;
                      });
                      print(pageChanged);
                    },
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      children: [
                        OnBoardingSlider(imageName: "Images/trip1.png"),
                        OnBoardingSlider(imageName: "Images/trip2.png"),
                        OnBoardingSlider(imageName: "Images/trip3.png"),
                      ],
                    ),
                ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        "Plan a Trip",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Text(
                                "Lorem epsum si simply dummy",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Text("text of printing and",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 1, left: 10),
                              child: Text("typesetting industry.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OnBoardingSliderButtons(color: pageChanged == 0 ? Colors.white: customGreen,),
                                  OnBoardingSliderButtons(color: pageChanged == 1 ? Colors.white: customGreen,),
                                  OnBoardingSliderButtons(color: pageChanged == 2 ? Colors.white: customGreen,),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomButton(
                                    onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                                    },
                                    color: Colors.white,
                                    height: 40,
                                    width: 100,
                                    value: "Skip",
                                    txtColor: customGreen,
                                  ),
                                  CustomButton(
                                    onPressed: (){
                                        if(pageChanged != 2){
                                          pageController.animateToPage(pageChanged == null ? pageChanged-1 : pageChanged+1, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                                        }
                                        else{
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterationForm()));
                                        }
                                    },
                                    color: Colors.white,
                                    height: 40,
                                    width: 100,
                                    value: "Next",
                                    txtColor: customGreen,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
