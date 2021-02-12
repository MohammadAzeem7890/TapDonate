import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:tap_donate/AddNgoModel.dart';
import 'package:tap_donate/ApiResponse.dart';
import 'package:tap_donate/Categories.dart';
import 'package:tap_donate/CategoryInformation.dart';
import 'package:tap_donate/DonateModel.dart';
import 'package:tap_donate/ForgotPasswordModel.dart';
import 'package:tap_donate/LoginResultModel.dart';
import 'package:tap_donate/NgoList.dart';
import 'package:tap_donate/User.dart' as  SignUpUser;
import 'package:tap_donate/loginModel.dart';

import 'AddDonatioModel.dart';
import 'CategoryModel.dart';


class Network {

  // ignore: non_constant_identifier_names
  static var base_url = "http://tapdonate.textiledigitizing.com/api/auth/v1/";
  static var image_base_url = "http://tapdonate.textiledigitizing.com/";

  /// call for user signup
  static Future<ApiResponse> signUp(SignUpUser.User user) async {
    // List<OrderDetails> orderDetails = List<OrderDetails>();
    //
    // orderDetails.add(OrderDetails(
    //     itemId: 1,
    //     itemPrice: 100,
    //     itemQuantity: 1,
    //     itemInstruction: "kjasdkjasd"));
    //
    // MetaDataOrder metaDataOrder = MetaDataOrder(orderDetails: orderDetails);
    //
    // AddOrders addOrders = AddOrders(
    //   address: "asdasda",
    //   contactNumber: "03070210516",
    //   couponDiscount: 20,
    //   couponId: 1,
    //   deliveryCharges: 600,
    //   deliveryZoneId: 1,
    //   email: "mwaqasiu@gmail.com",
    //   firstName: "Raja",
    //   lastName: "Poran",
    //   grandTotal: 800,
    //   metaData: metaDataOrder,
    //   orderInstruction: "hjsagdjaghsdjhgas",
    //   orderStatus: "pending",
    //   shopId: 1
    // );

    final http.Response response = await http.post(base_url+"signup",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'user_name': user.userName,
        'user_email' : user.userEmail,
        'user_number' : user.userNumber,
        'user_password' : user.userPassword,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      //print();
      print(response.body);
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load signup');
    }
  }
  //
  // static Future<ApiResponse> te(User user) async{
  //   final http.Response response = await http.post(
  //     base_url + "login",
  //     headers: <String, String>{
  //       "Content-Type": "application/json; charset=UTF-8"
  //     },
  //     body: jsonEncode(<dynamic, dynamic>{
  //       'user_email' : user.userEmail,
  //       'user_password' : user.userPassword,
  //     }),
  //   );
  // }

  static Future<LoginResultModel> logIn(LoginModel loginModel) async{
    final http.Response response = await http.post(
      base_url + "login",
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<dynamic, dynamic>{
        'user_email': loginModel.email,
        'user_password': loginModel.password
      }),
    );
    if(response.statusCode == 200){
      print(response.body);
      return LoginResultModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("Failed to login !");
    }
  }
  //
  // static Future<DonateModel> donateMoney(DonateModel donateModel) async{
  //   final http.Response response = await http.post(
  //     base_url + "getallngos",
  //     headers: <String, String>{
  //       "Content-Type": "application/json"
  //     },
  //     body: jsonEncode(<dynamic, dynamic>{
  //       "DonationOrganization": donateModel.donationOrganization,
  //       "DonationPurpose": donateModel.donationPurpose,
  //       "School": donateModel.school,
  //       "totalAmount": donateModel.totalAmount,
  //       "paymentMethod": donateModel.paymentMethod,
  //       "AmountPayable": donateModel.AmountPayable,
  //       "name": donateModel.name,
  //       "email": donateModel.email,
  //       "contact": donateModel.mobile
  //     }),
  //   );
  //
  //   if(response.statusCode == 200){
  //     print(response.body);
  //   }
  //   else{
  //     throw Exception("Failed to donate");
  //   }
  // }

  static Future<CategoryInformation> getNgoCategoryInformation(int category) async {
    final http.Response respone = await http.get(
        Uri.encodeFull(base_url + "getngocategory/" + category.toString()),
        headers: {
          "Accept": "application/json"
        }
    );
    if(respone.body == 200){
      return CategoryInformation.fromJson(jsonDecode(respone.body));
    }
    else{
      throw Exception("Could not get information");
    }
  }

  static Future<ApiResponse> addDonation(AddDonation addDonation) async{
    final http.Response response = await http.post(
      base_url + "donation",
      headers: <String, String>{
        "Content_Type": "application/json; Charset=UTF-8"
      },
      body: jsonEncode(<dynamic, dynamic>{
        'ngo_id' : addDonation.ngoId,
        'user_id': addDonation.userId,
        'category_id': addDonation.categoryId,
        'description': addDonation.description,
        'pickup_location': addDonation.pickUpLocation
      }),
    );
    if(response.statusCode == 200){
      print(response.body);
    }
    else{
      throw Exception("Donation Failed !");
    }
  }


  static Future<NgoList> getNgoList() async {
    final http.Response response = await http.get(
        Uri.encodeFull(base_url + "getallngos"),
        headers: {
          "Accept": "application/json"
        }
    );
    if(response.statusCode == 200){
      //print(ngoList.length);
      //print("*********");
      //print(list);
      return NgoList.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("Could not get ngoList");
    }
  }
   static Future<List<GetNgos>> getNgo() async{
     List<GetNgos> ngoInfo;
    Network.getNgoList().then((value) => {
        ngoInfo = value.getNgos.toList(),
      print(ngoInfo.length)
    });
    //return ngoInfo;
  }

  static Future<CategoryModel> getCategories() async {
    final http.Response response = await http.get(
      Uri.encodeFull(base_url + "getngocategory/1"),
      headers: {
        "Accept": "application/json"
      }
    );
    if(response.statusCode == 200){
      return CategoryModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("loading...");
    }
  }

  static Future<List<NgoCategoryList>> getCategory() {
    List<NgoCategoryList> categoryInfo;
    Network.getCategories().then((value) => {
      categoryInfo = value.ngoCategory.toList(),
    });
  }

  static Future<ForgotPasswordModel> updatePassword(ForgotPasswordModel forgotPasswordModel) async{
    final http.Response response = await http.post(
      base_url + "signup",
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<dynamic, dynamic>{
        'user_email': forgotPasswordModel.email,
        'user_password': forgotPasswordModel.email
      }),
    );
    if(response.statusCode == 200){
      print(response.body);
      return ForgotPasswordModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("Failed to Update !");
    }
  }

  static final picker = ImagePicker();
  File image;
  static Future getNgoImage(File image) async{
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    if(pickedImage != null){
      image = File(pickedImage.path);
    }
    else{
      print('could not get image');
    }
  }

  static Future<AddNgoModel> addNewNgo(AddNgoModel addNgoModel) async{
    final http.Response response = await http.post(
      base_url + "v1/addngo",
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(<dynamic, dynamic>{
        'ngo_name': addNgoModel.ngoName,
        'ngo_contact': addNgoModel.ngoContact,
        'ngo_address': addNgoModel.ngoAddress,
        'ngo_logo_image': addNgoModel.ngoLogoImage,
      }),
    );
    if(response.statusCode == 200){
      print('new ngo added');
    }
    else{
      throw Exception("Could not add ngo");
    }
  }


// Future<ItemModel> getitemmodel() async {
//   var get_item_url = Network.base_url + "getproducts";
//   final response = await get(Uri.encodeFull(get_item_url));
//   print(Uri.encodeFull(get_item_url));
//   if (response.statusCode == 200) {
//     // print("data of api ${response.body}");
//     return ItemModel.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('nullll');
//   }
// }
// Future<Deliveryzone> getZones() async {
//   var getZoneurl = Network.base_url + "getdeliveryzones";
//   final response = await get(Uri.encodeFull(getZoneurl));
//   print(Uri.encodeFull(getZoneurl));
//   if (response.statusCode == 200) {
//     // print("data of api ${response.body}");
//     return Deliveryzone.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('nullll');
//   }
// }
// static void postMyData() async {
//   List<OrderDetails> orderDetails = List<OrderDetails>();
//
//   orderDetails.add(OrderDetails(
//       itemId: 1,
//       itemPrice: 100,
//       itemQuantity: 1,
//       itemInstruction: "kjasdkjasd"));
//
//   MetaDataOrder metaDataOrder = MetaDataOrder(orderDetails: orderDetails);
//
//   AddOrders addOrders = AddOrders(
//     address: "asdasda",
//     contactNumber: "03070210516",
//     couponDiscount: 20,
//     couponId: 1,
//     deliveryCharges: 600,
//     deliveryZoneId: 1,
//     email: "mwaqasiu@gmail.com",
//     firstName: "Raja",
//     lastName: "Poran",
//     grandTotal: 800,
//     metaData: metaDataOrder,
//     orderInstruction: "hjsagdjaghsdjhgas",
//     orderStatus: "pending",
//     shopId: 1
//   );
//
//   // Map<dynamic, dynamic> body = {
//   //   "delivery_zone_id": '1',
//   //   "coupon_id": "1",
//   //   "first_name": "Asad",
//   //   "last_name": "Amjad",
//   //   "email": "asadamjad781@gmail.com",
//   //   "address": "Mehmoodabad",
//   //   "contact_number": "0336283392",
//   //   "order_instruction": "with meal and ketchup and spicy",
//   //   "grand_total": "800",
//   //   "coupon_discount": "20",
//   //   "delivery_charges": "600",
//   //   "order_status": "pending",
//   //   "meta_data": metaDataOrder.,
//   //   "shop_id": "1"
//   // };
//
//   var postDataUrl = Network.base_url + "addorders";
//
//   // FormData formData = FormData();
//   // formData.append("first_name", "Hello");
//
//
//
//   final response = await post(postDataUrl, body: formData);
//
//   if (response.statusCode == 200) {
//     // print("data of api ${response.body}");
//     print("success");
//   } else {
//     print("error :(:(:(:(:(");
//     // throw Exception('nullll');
//   }
// }
}