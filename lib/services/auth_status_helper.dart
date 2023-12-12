import 'package:shared_preferences/shared_preferences.dart';

class AuthStatusHelper {
  static const String _authKey = 'auth_status';

  // Save authentication status
  static Future<void> saveAuthStatus(bool isAuthenticated) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_authKey, isAuthenticated);
  }

  // Get authentication status
  static Future<bool?> getAuthStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print (prefs.getBool(_authKey));
    return prefs.getBool(_authKey);
  }

  // Save user ID
  static Future<void> saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
  }

  // Get user ID
  static Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }
}
