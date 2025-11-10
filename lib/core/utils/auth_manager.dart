import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_application/core/di/locator.dart';

class AuthManager {
  static ValueNotifier<String?> authChangeNotifier =
      ValueNotifier(null);
  static final SharedPreferences _sharedPreferences =
      locator.get();

  static void saveToken(String token) {
    _sharedPreferences.setString(
      'access_token',
      token,
    );

    authChangeNotifier.value = token;
  }

  static String readAuth() {
    return _sharedPreferences.getString(
          'access_token',
        ) ??
        '';
  }

  static void logout() {
    _sharedPreferences.clear();
    authChangeNotifier.value = null;
  }

  static bool isLogedin() {
    String token = readAuth();
    return token.isNotEmpty;
  }
}
