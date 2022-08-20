import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  Constants._();
  Constants();
  static const double padding = 20;

  static const double avatarRadius = 45;
  // static const BASE_URL = "https://192.168.43.116:90/";
  // static String BASE_URL = "http://${await _ip}:90/api/";

  static Future<String> get BASE_URL async => "http://${await ip}:90/api/";

  static Future<String> get userId async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id') ?? "0";
  }

  static Future<String> get ip async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('ip') ?? "0.0.0.0";
  }

  Future<bool> setIp(String ip) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('ip', ip);
  }

  static Future<String> get userName async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_name') ?? "no name";
  }
}
