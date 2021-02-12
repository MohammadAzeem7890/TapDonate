
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_donate/DonationPurposeModel.dart';

class DonationPurpose extends StatefulWidget {
  @override
  _DonationPurposeState createState() => _DonationPurposeState();
}

class _DonationPurposeState extends State<DonationPurpose> {

  Color customGreen = new Color(0xff24B58F);

  List<DonationPurposeModel> _donationPurposeList = [
    DonationPurposeModel(id: 1, name: "Zakat"),
    DonationPurposeModel(id: 2, name: "Education"),
    DonationPurposeModel(id: 3, name: "Tour"),
    DonationPurposeModel(id: 4, name: "School"),
    DonationPurposeModel(id: 5, name: "Car"),
    DonationPurposeModel(id: 6, name: "Travel"),
    DonationPurposeModel(id: 7, name: "Treatment")
  ];

  List<DropdownMenuItem<DonationPurposeModel>> _donationPurposeItemList;
  DonationPurposeModel _selectedItem;

  @override
  void initState(){
    super.initState();
    _donationPurposeItemList = buildDonationPurposeList(_donationPurposeList);
    _selectedItem = _donationPurposeItemList[0].value;
  }

  List<DropdownMenuItem<DonationPurposeModel>> buildDonationPurposeList(List listItems){
    List<DropdownMenuItem<DonationPurposeModel>> _items = List();
    for(DonationPurposeModel donationPurposes in listItems){
      _items.add(
          DropdownMenuItem(
            child: Text(donationPurposes.name),
            value: donationPurposes,
          )
      );
    }
    return _items;
  }


  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: DropdownButton<DonationPurposeModel>(
          elevation: 0,
          value: _selectedItem,
          items: _donationPurposeItemList,
          underline: Container(
            color: Colors.white,
          ),
          icon: Padding(
            padding: const EdgeInsets.only(left: 170),
            child: Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 25,
              color: Colors.green,
            ),
          ),
          style: TextStyle(
            color: customGreen,
            fontSize: 14,
          ),
          onChanged: (val)  async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            setState(() {
              _selectedItem = val;
              prefs.setInt("donation_purpose", val.id);
            });
          },
        ),
      ),
    );
  }
}
