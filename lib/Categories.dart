// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final title = 'Basic List';
//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.orangeAccent,
//           title: Text(title),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(5),
//           child: ListView(
//             children: <Widget>[
//               ListTile(
//                 tileColor: Colors.orange[300],
//                 leading: Icon(Icons.map, size: 25, color: Colors.white,),
//                 title: Text("Google", style: TextStyle(fontSize: 20, color: Colors.white),),
//                 trailing: Icon(Icons.add_rounded, size: 25, color: Colors.white,),
//               ),
//               Divider(height: 2, color: Colors.white, thickness: 1,),
//               ListTile(
//                 tileColor: Colors.orange[500],
//                 leading: Icon(Icons.phone, size: 25, color: Colors.white,),
//                 title: Text("Phone", style: TextStyle(fontSize: 20, color: Colors.white),),
//                 trailing: Icon(Icons.add_rounded, size: 25, color: Colors.white,),
//               ),
//               Divider(height: 2, color: Colors.white, thickness: 1),
//               ListTile(
//                 tileColor: Colors.orange[700],
//                 leading: Icon(Icons.photo_album, size: 25, color: Colors.white,),
//                 title: Text("PhotoAlbum", style: TextStyle(fontSize: 20, color: Colors.white),),
//                 trailing: Icon(Icons.add_rounded, color: Colors.white,),
//               )
//             ],
//           ),
//         )
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:tap_donate/SearchCategories.dart';
import 'CategoryModel.dart';
import 'HomePage.dart';
import 'Network.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(Categories());

class Categories extends StatefulWidget {
  @override
  CategoriesState createState() => CategoriesState();
}

const url = "http://tapdonate.textiledigitizing.com/api/auth/v1/getngocategory/1";

class CategoriesState extends State<Categories> {
  Color custom = new Color(0xff24B58F);

  final icons = [
    Icons.phone_android_rounded,
    Icons.car_rental,
    Icons.pets,
    Icons.single_bed,
    Icons.tv,
    Icons.favorite_outline_sharp,
    Icons.home,
    Icons.home_work,
    Icons.king_bed_rounded,
    Icons.bike_scooter_outlined,
    Icons.settings,
    Icons.book_online_outlined,
    Icons.settings,
    Icons.book_online_outlined,
    Icons.settings,
    Icons.book_online_outlined,
    Icons.phone_android_rounded,
    Icons.car_rental,
    Icons.pets,
    Icons.single_bed,
    Icons.tv,
    Icons.favorite_outline_sharp,
    Icons.home,
    Icons.home_work,
    Icons.king_bed_rounded,
    Icons.bike_scooter_outlined,
    Icons.settings,
    Icons.book_online_outlined,
    Icons.settings,
    Icons.book_online_outlined,
    Icons.settings,
    Icons.book_online_outlined
  ];
  Future<CategoryModel> category;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = Network.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: custom,
          leading: Container(
            padding: EdgeInsets.only(top: 15),
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 18,
                textDirection: TextDirection.ltr,
                color: Colors.white,
              ),
            ),
          ),
          title: Padding(
              padding: const EdgeInsets.only(top: 15, right: 50),
              child: Center(
                child: Text(
                  "Categories".toUpperCase(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )),
        ),
        body: FutureBuilder<CategoryModel>(
          future: category,
          builder: (context, AsyncSnapshot<CategoryModel> snapShot){
            if(!snapShot.hasData){
              return Center(
                child: CircularProgressIndicator(backgroundColor: custom,),
              );
            }
            else{
              return ListView.separated(
                itemCount: snapShot.data.ngoCategory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.white10,
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: custom,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        icons[index],
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      snapShot.data.ngoCategory[index].categoryName,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.black26,
                    ),
                    onTap: () async{
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchCatergories()));
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setInt("category_Id", snapShot.data.ngoCategory[index].categoryId);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(height: 0.5, color: Colors.black45);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
