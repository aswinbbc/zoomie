import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  Constants._();
  static const double padding = 20;

  static const double avatarRadius = 45;
  // static const BASE_URL = "https://hosted_url.com/";
  static const BASE_URL = "http://192.168.238.116:90/api/";

  static Future<String> get userId async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id') ?? "0";
  }

  static Future<String> get userName async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_name') ?? "no name";
  }
}
