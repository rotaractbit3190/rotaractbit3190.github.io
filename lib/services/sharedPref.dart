import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(THEME_STATUS, value);
  }
  Future<bool> getTheme() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(THEME_STATUS) ?? false;
  }
  static const SIGNIN_STATUS = "SIGN_IN_STATUS";
  static const USERNAME = "USERNAME";
  static const EMAIL = "EMAIL";

  setSignInStatus(bool value) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(SIGNIN_STATUS, value);
    // preferences.setString(USERNAME, username);
  }
  Future<bool> getSignInStatus() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(SIGNIN_STATUS) ?? false;
  }
  Future<String> getUsername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(USERNAME) ?? "";
  }
  setUsername(String value) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setBool(SIGNIN_STATUS, value);
    preferences.setString(USERNAME, value);
  }
  Future<String> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(EMAIL) ?? "";
  }
  setEmail(String value) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setBool(SIGNIN_STATUS, value);
    preferences.setString(EMAIL, value);
  }
}


class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;
  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  set isSignedIn(bool value) {
    _isSignedIn = value;
    darkThemePreference.setSignInStatus(value);
    notifyListeners();
  }
  String _username = "";
  String get username => _username;
  set username(String username) {
    _username = username;
    darkThemePreference.setUsername(username);
    notifyListeners();
  }
  String _email = "";
  String get email => _email;
  set email(String email) {
    _email = email;
    darkThemePreference.setEmail(email);
    // notifyListeners();
  }
}

