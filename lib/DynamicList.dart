// // import 'package:flutter/animation.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// //
// // void main() => runApp(DynamicList());
// //
// // class DynamicList extends StatelessWidget {
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         body: ListView.builder(
// //           itemCount: 13,
// //           itemBuilder: (context, index) {
// //             return Container(
// //               margin: EdgeInsets.all(1),
// //               child: Card(
// //                 child: ListTile(
// //                   leading: Container(
// //                     child: Icon(Icons.phone_android_rounded),
// //                   ),
// //                   title: Text('Phone'),
// //                   trailing: Icon(Icons.arrow_forward_ios),
// //                 ),
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';

class DynamicList extends StatelessWidget {
  Color custom = new Color(0xff24B58F);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 5, left: 0, right: 0),
              child: Card(
                child: ListTile(
                  dense: false,
                  leading: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: custom,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(
                      Icons.phone_android_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    "Mobiles",
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                    color: Colors.black26,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() => runApp(DynamicList());
