import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  static const uidKey = "uidKey";

  /// Saving User ID in Shared Preferences
  static Future<bool> saveUserID(String uid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("SAVED USER ID in PREFENCES ${uid}");
    return await preferences.setString(uidKey, uid);
  }

  /// GettingUser ID in Shared Preferences

  static Future<String?> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(uidKey);
  }

  /// Deleting User ID in Shared Preferences

  static Future<bool> deleteUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }
}
