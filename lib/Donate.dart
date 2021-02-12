import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_donate/CustomAppBar.dart';
import 'package:tap_donate/CustomButton.dart';
import 'package:tap_donate/CustomTextField.dart';
import 'package:tap_donate/DonationOrganizations.dart';
import 'package:tap_donate/DonationPurpose.dart';
import 'DonateFieldLabel.dart';
import 'HomePage.dart';

class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  TextEditingController email = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController amount = new TextEditingController();
  TextEditingController amountPayable = new TextEditingController();

  Color customGreen = new Color(0xff24B58F);
  int _selectedRadio;

  @override
  void initState() {
    super.initState();
    _selectedRadio = 0;
  }

  setSelectedRadio(val) {
    setState(() {
      _selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomAppBar(
            title: "Donate",
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Divider(
                height: 15,
                color: Colors.white,
              ),
              DonateFieldLabels(
                label: "Donation Organization",
              ),
              Container(
                width: double.maxFinite,
                height: 38,
                decoration: new BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: customGreen, width: 1),
                ),
                margin: const EdgeInsets.only(top: 5, left: 30, right: 30),
                child: DonationOrganizations(),
              ),
              DonateFieldLabels(
                label: "Donation Purpose",
              ),
              Container(
                width: double.maxFinite,
                height: 38,
                decoration: new BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: customGreen, width: 1),
                ),
                margin: const EdgeInsets.only(top: 5, left: 30, right: 30),
                child: DonationPurpose(),
              ),
              DonateFieldLabels(
                label: "Amount",
              ),
              CustomTextField(
                color: Colors.white,
                controller: amount,
                height: 40,
              ),
              DonateFieldLabels(
                label: "Payment Method",
              ),
              Container(
                  height: 35,
                  padding: const EdgeInsets.only(left: 10),
                  margin: EdgeInsets.only(top: 5),
                  child: ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: _selectedRadio,
                        activeColor: customGreen,
                        onChanged: (val) {
                          setSelectedRadio(val);
                        },
                      ),
                      Radio(
                        value: 2,
                        groupValue: _selectedRadio,
                        activeColor: customGreen,
                        onChanged: (val) {
                          setSelectedRadio(val);
                        },
                      )
                    ],
                  )),
              DonateFieldLabels(
                label: "Card(Add. Charges: 2.7% + FED)"
                    "Bill Payment(Add. Charges 20th till 10,000 till 250,000 etc.)",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Amount Payable",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
              ),
              CustomTextField(
                height: 40,
                controller: amountPayable,
              ),
              DonateFieldLabels(
                label: "Name",
              ),
              CustomTextField(
                controller: name,
                placeholder: "Name",
                height: 40,
                color: Colors.white,
              ),
              DonateFieldLabels(
                label: "Email: (abc@abc.com",
              ),
              CustomTextField(
                controller: email,
                placeholder: "Email",
                height: 40,
                color: Colors.white,
              ),
              DonateFieldLabels(
                label: "Mobile: (03310909871)",
              ),
              CustomTextField(
                controller: mobile,
                placeholder: "Mobile",
                height: 40,
                color: Colors.white,
              ),
              Divider(
                color: Colors.white,
                height: 12,
              ),
              CustomButton(
                  color: customGreen,
                  txtColor: Colors.white,
                  height: 45,
                  width: 295,
                  value: "Submit".toUpperCase(),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("donation_amount", amount.text);
                    prefs.setString("donation_paymentMethod", _selectedRadio.toString());
                    prefs.setString("donation_amountPayable", amountPayable.text);
                    prefs.setString("donator_name", name.text);
                    prefs.setString("donator_email", email.text);
                    prefs.setString("donator_mobile", mobile.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }),
              Divider(
                color: Colors.white,
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
