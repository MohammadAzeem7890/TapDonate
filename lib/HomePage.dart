import 'package:flutter/material.dart';
import 'package:tap_donate/NavDrawer.dart';
import 'package:tap_donate/Network.dart';
import 'package:tap_donate/NgoList.dart';
import 'package:tap_donate/categories.dart';

void main() => runApp(MaterialApp(
  title: "",
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const baseUrl = "http://tapdonate.textiledigitizing.com/api/auth/v1/getallngos";

class _HomePageState extends State<HomePage> {

  Color customGreen = new Color(0xff24B58F);

  final buttontitle = "Tab Donate";
  Future<NgoList> ngoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ngoList =  Network.getNgoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: customGreen,
            title: Padding(
              padding: const EdgeInsets.only(top: 5, right: 70),
              child: Center(
                child: Text(
                  "Home".toUpperCase(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ),
        body: FutureBuilder<NgoList>(
          future:  ngoList,
          builder: (context,AsyncSnapshot<NgoList> snapshot) {
            if(!snapshot.hasData){
              return Center(
              child: CircularProgressIndicator(backgroundColor: customGreen),
              );
            }else{
              return ListView.builder(
                itemCount: snapshot.data.getNgos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Categories())),
                    child: Card(
                      shadowColor: Colors.black87,
                      elevation: 2,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Image.network(Network.image_base_url + snapshot.data.getNgos[index].ngoLogoPath + snapshot.data.getNgos[index].ngoLogoImageName),
                            ),
                            title: Text(
                              snapshot.data.getNgos[index].ngoName,
                              style: TextStyle(fontSize: 14),
                            ),
                            subtitle: Text(
                              snapshot.data.getNgos[index].ngoAddress,
                              style: TextStyle(fontSize: 12),
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(bottom: 35),
                              child: Text(
                                "...",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                          ListTile(
                              dense: true,
                              leading: Text(
                                snapshot.data.getNgos[index].ngoContact,
                                style: TextStyle(fontSize: 10, color: Colors.black87),
                              ),
                              trailing: Container(
                                height: 30,
                                width: 100,
                                margin: EdgeInsets.only(bottom: 15),
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Categories()),
                                    );
                                  },
                                  color: customGreen,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(color: customGreen, width: 2),
                                  ),
                                  child: Text(
                                    buttontitle.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

          }
        ));
  }

}
