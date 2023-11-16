import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<void> setEmail(String email) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('email', email);
  }

  static Future<String?> getEmail() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString('email');
  }

  static Future<void> deleteEmail(String email) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('email');    
  }
}
