import 'package:tap_donate/Donate.dart';

class DonateModel {
  String donationOrganization;
  String donationPurpose;
  String school;
  String totalAmount;
  String paymentMethod;
  String AmountPayable;
  String name;
  String email;
  String mobile;

  DonateModel({
    String donationOrganization,
    String donationPurpose,
    String school,
    String totalAmount,
    String paymentMethod,
    String AmountPayable,
    String name,
    String email,
    String mobile
  }){
    this.donationOrganization = donationOrganization;
    this.donationPurpose = donationPurpose;
    this.school = school;
    this.totalAmount = totalAmount;
    this.paymentMethod = paymentMethod;
    this.AmountPayable = AmountPayable;
    this.name = name;
    this.email = email;
    this.mobile = mobile;
  }
  DonateModel.fromJson(Map<String, dynamic> json){
    this.donationOrganization = json['DonationOrganization'];
    this.donationPurpose = json['DonationPurpose'];
    this.school = json['school'];
    this.totalAmount = json['total'];
    this.paymentMethod = json['payment Method'];
    this.name = json['name'];
    this.email =json['email'];
    this.mobile = json['mobile'];
  }
}
