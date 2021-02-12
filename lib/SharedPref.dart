import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  String key;
  SharedPref({this.key});

  Future setVisitingFlag() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, true);
  }
  Future getVisitedFlag() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool alreadyVisited = prefs.getBool(key) ?? false;
    return alreadyVisited;
  }
  Future RemoveVisitedUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

}