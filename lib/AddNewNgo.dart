import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tap_donate/AddNgoModel.dart';
import 'package:tap_donate/CustomButton.dart';
import 'package:tap_donate/CustomTextField.dart';
import 'package:tap_donate/DonateFieldLabel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tap_donate/HomePage.dart';
import 'package:tap_donate/Network.dart';

void main() => runApp(MaterialApp(home: AddNewNgo(),));

class AddNewNgo extends StatefulWidget {
  @override
  _AddNewNgoState createState() => _AddNewNgoState();
}

class _AddNewNgoState extends State<AddNewNgo> {
  Color customGreen = new Color(0xff24B58F);

  TextEditingController ngoName = TextEditingController();
  TextEditingController ngoContact = TextEditingController();
  TextEditingController ngoAddress = TextEditingController();

  File image;
  final picker = ImagePicker();

  Future getCameraImage() async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if(pickedFile != null){
        image = File(pickedFile.path);
      }
      else{
        setState(() {
          AlertDialog(title: Text("No Image Selected"),);
        });
      }
    });
  }

  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: customGreen,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,),),
        title: Text('Add Ngo',),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: DonateFieldLabels(label: "Organization Name",),
            ),
            CustomTextField(height: 50, controller: ngoName, color: Colors.white,),
            DonateFieldLabels(label: "Contact Number",),
            CustomTextField(height: 50, controller: ngoContact, color: Colors.white,),
            DonateFieldLabels(label: "Organization Address",),
            CustomTextField(height: 50, controller: ngoAddress, color: Colors.white,),
            DonateFieldLabels(label: "Organization Image",),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: InkWell (
                onTap: getCameraImage,
                child: Card(
                  color: Colors.white70,
                  elevation: 1,
                  child: ListTile(
                    leading: Icon(Icons.camera, color: customGreen,),
                    title: Text("Choose Image",style: TextStyle(color: customGreen),),
                  ),
                ),
              ),
            ),
            Container(
              height: height,
              width: width,
              child: image == null ? CircularProgressIndicator() : Image.file(image, fit: BoxFit.fill,),
            ),
            CustomButton(
              onPressed: (){
                Network.addNewNgo(AddNgoModel(ngoName: ngoName.text, ngoContact: ngoContact.text, ngoAddress: ngoAddress.text, ngoLogoImage: image.path));
                //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                setState(() {
                  height = height + 200;
                  width = width + 300;
                });
              },
              height: 45,
              width: 280,
              color: customGreen,
              txtColor: Colors.white,
              value: "submit", fontSize: 18,
            )
          ],
        ),
      ),
    );
  }
}
