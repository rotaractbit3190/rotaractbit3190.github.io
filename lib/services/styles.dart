import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_website/services/sharedPref.dart';

abstract class Styles {
  // static DarkThemeProvider themeProvider = new DarkThemeProvider();
  //
  // static void getCurrentAppTheme() async{
  //   themeProvider.darkTheme = await themeProvider.darkThemePreference.getTheme();
  // }
  static ThemeData themeData(bool isDarkTheme, BuildContext context, bool isLightTheme) {
    // getCurrentAppTheme();
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    // isDarkTheme = isLightTheme?isDarkTheme:!isDarkTheme;
    // themeChange.darkTheme = isDarkTheme;
    return ThemeData(
      //* Custom Google Font
      //  fontFamily: Devfest.google_sans_family,
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Colors.grey[700] : Colors.white,

      backgroundColor: isDarkTheme ? Colors.grey[900] : Color(0xffF1F5FB),

      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Colors.grey[600] : Color(0xffFF8212),

      hintColor: isDarkTheme ? Colors.grey.withOpacity(0.75) : Color(0xffEECED3),

      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      // hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),

      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.grey[900] : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}