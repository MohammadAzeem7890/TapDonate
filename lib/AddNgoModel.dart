import 'dart:io';

class AddNgoModel{
  String ngoName;
  String ngoContact;
  String ngoAddress;
  File ngoLogoImage;
  File ngoCoverImage;

  AddNgoModel({this.ngoName, this.ngoContact, this.ngoAddress , this.ngoLogoImage, this.ngoCoverImage});

  AddNgoModel.fromJson(Map<String, dynamic> json){
    this.ngoName = json['ngo_name'];
    this.ngoContact = json['ngo_contact'];
    this.ngoAddress = json['ngo_address'];
    this.ngoLogoImage = json['ngo_logo_image'];
    this.ngoCoverImage = json['ngo_cover_image'];
  }

}