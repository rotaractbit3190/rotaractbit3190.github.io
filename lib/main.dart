// import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_website/Board/Board.dart';
import 'package:rotaract_website/Contact/Contact_us.dart';
import 'package:rotaract_website/DashBoard/dashboard.dart';
import 'package:rotaract_website/Event/Event.dart';
import 'package:rotaract_website/Register/cybersec.dart';
import 'package:rotaract_website/Register/logIn.dart';
import 'package:rotaract_website/Register/razorpayWeb.dart';
import 'package:rotaract_website/Rotary/Rotary.dart';
import 'package:rotaract_website/Rotary/prism.dart';
import 'package:rotaract_website/home/Home.dart';
import 'package:rotaract_website/home/homePage.dart';
import 'package:rotaract_website/Register/register.dart';
import 'package:rotaract_website/services/sharedPref.dart';
import 'package:rotaract_website/services/styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = new DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeProvider.darkTheme =
        await themeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => HomePage(),
              '/rotary': (context) => Rotary(),
              '/events': (context) => Event(),
              '/board': (context) => Board(),
              '/contact_us': (context) => Contact_us(),
              '/register': (context) => Register(),
              '/login': (context) => SignIn(),
              '/dashboard': (context) => DashBoard(),
              '/prism': (context) => Prism(),
              '/payment': (context) => RazorPayWeb(),
              // '/cybersec': (context) => CyberSec(),
            },
            initialRoute: '/',
            title: 'Rotaract Club of BIT',
            theme: Styles.themeData(themeProvider.darkTheme, context, true),
            // darkTheme: Styles.themeData(themeProvider.darkTheme, context, false),
          );
        },
      ),
    );
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  if (settings.name == '/foo') {
    // FooRoute constructor expects SomeObject
    // return _buildRoute(settings, new FooRoute(settings.arguments));
  }

  return null;
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
    settings: settings,
    builder: (ctx) => builder,
  );
}
