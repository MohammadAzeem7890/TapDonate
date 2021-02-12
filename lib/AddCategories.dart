import 'package:flutter/material.dart';

class AddCategories extends StatelessWidget {
  Color customGreen = new Color(0xff24B58F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: customGreen,
        leading: FlatButton(
          padding: EdgeInsets.only(top: 20),
          onPressed: () {},
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 20, left: 30),
          child: Center(
            child: Text("categories".toUpperCase()),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 110,
              width: double.infinity,
              color: customGreen,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 30, right: 30, bottom: 10),
                child: TextField(
                  style: TextStyle(color: customGreen),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.search,
                        color: customGreen,
                        size: 20,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: customGreen,
                      fontSize: 17,
                    ),
                    enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: customGreen)),
                    focusedBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: customGreen),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 50, left: 30, right: 30),
                        child: TextField(
                          style: TextStyle(color: customGreen),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 30),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Categories".toUpperCase(),
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: customGreen,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(color: customGreen)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: customGreen, width: 1),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 35,
                                  color: customGreen,
                                  textDirection: TextDirection.ltr,
                                ),
                              )),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: TextField(
                          maxLines: 12,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintMaxLines: 14,
                            filled: true,
                            fillColor: customGreen,
                            hintText: "description".toUpperCase(),
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            contentPadding:
                            EdgeInsets.only(top: 25, left: 20, right: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: customGreen)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: customGreen),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: TextField(
                          maxLines: 3,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: customGreen,
                            hintText: "description".toUpperCase(),
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            contentPadding:
                            EdgeInsets.only(top: 25, left: 20, right: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: customGreen)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: customGreen),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 350,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: FlatButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: customGreen),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          color: customGreen,
                          child: Text(
                            "submit".toUpperCase(),
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
