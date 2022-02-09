import 'package:shared_preferences/shared_preferences.dart';

class LocalDb{
  static final uidKey="shjsdfhdkgjh";

  static Future<bool>saveUserID(String uid)async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    return await preferences.setString(uidKey,uid);
  }



  static Future<String?>getUserID()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    return await preferences.getString(uidKey);
  }


}