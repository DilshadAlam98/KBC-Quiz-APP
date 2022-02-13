import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  static const uidKey = "s4985734hjd";
  static const rankKey = "jjd8494jdg";
  static const levelKey = "jjd8494ds5546jdg";
  static const moneyKey = "ui4536fddKey";
  static const nameKEy = "d5465w564e5ffy44";
  static const profileUrlkey = "d5465w544364ss64e5ffy44";
  static const profilelocalImage = "d5465w3453544364ss64e5ffy44";


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

  /// Saving Rank  in Shared Preferences
  static Future<bool> saveRank(String rank) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("SAVED USER ID in PREFENCES ${rank}");
    return await preferences.setString(rankKey, rank);
  }

  static Future<String?> getRank() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(rankKey);
  }

  /// Saving Level in Shared Preferences
  static Future<bool> saveLevel(String level) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("SAVED USER ID in PREFENCES ${level}");
    return await preferences.setString(levelKey, level);
  }

  /// Getting level from Shared Preferences
  static Future<String?> getLevel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(levelKey);
  }

  /// Saving money in Shared Preferences
  static Future<bool> saveMoney(String money) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("SAVED USER ID in PREFENCES ${moneyKey}");
    return await preferences.setString(moneyKey, money);
  }

  /// getting money from Shared Preferences
  static Future<String?> getMoney() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(moneyKey);
  }

  /// Saving name in Shared Preferences
  static Future<bool> saveName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("SAVED USER ID in PREFENCES ${name}");
    return await preferences.setString(nameKEy, name);
  }

  /// getting name from Shared Preferences
  static Future<String?> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nameKEy);
  }

  /// Saving Profile Picture url in Shared Preferences
  static Future<bool> saveProfileUrl(String profileUrl) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("SAVED USER ID in PREFENCES ${profileUrl}");
    return await preferences.setString(profileUrlkey, profileUrl);
  }

  /// getting ProfilePicture url from Shared Preferences
  static Future<String?> getProfileUrl() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(profileUrlkey);
  }

  /// Saving Profile Picture url in Shared Preferences
  static Future<bool> saveProfilePicCamera(String imageFile) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("SAVED IMAGE PATH TO PREFENCES ${imageFile}");
    return await preferences.setString(profilelocalImage, imageFile);
  }

  /// getting ProfilePicture url from Shared Preferences
  static Future<String?> getProfilePicCamera() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("GET IMAGE PATH FROM PREFERENCES");
    return await preferences.getString(profilelocalImage);
  }

  /// Deleting User ID in Shared Preferences

  static Future<bool> deleteUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }
}
