import 'package:flutter/material.dart';
import 'package:tap_donate/Network.dart';
import 'package:tap_donate/NgoList.dart';

class DonationOrganizations extends StatefulWidget {
  @override
  _DonationOrganizationsState createState() => _DonationOrganizationsState();
}

class _DonationOrganizationsState extends State<DonationOrganizations> {
  Future<NgoList> getNgoList;
  GetNgos _selectedItem;

  void initState() {
    super.initState();
    getNgoList = Network.getNgoList();
  }

  Color customGreen = new Color(0xff24B58F);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30),
      child: FutureBuilder<NgoList>(
        future: getNgoList,
        builder: (context, AsyncSnapshot<NgoList> snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator(
              backgroundColor: customGreen,
            );
          } else {
            return DropdownButton<GetNgos>(
              underline: Container(
                color: Colors.transparent,
              ),
              icon: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 30,
                  color: customGreen,
                ),
              ),
              hint: Text(
                "Select organization",
                style: TextStyle(color: customGreen),
              ),
              value: _selectedItem,
              onChanged: (GetNgos Value) {
                setState(() {
                  _selectedItem = Value;
                });
              },
              items: snapshot.data.getNgos.map((GetNgos ngo) {
                return DropdownMenuItem<GetNgos>(
                  value: ngo,
                  child: Text(
                    ngo.ngoName,
                    style: TextStyle(color: customGreen),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
