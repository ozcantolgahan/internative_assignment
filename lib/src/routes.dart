import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internative_assignment/src/screens/home_screen.dart';
import 'package:internative_assignment/src/screens/landing_screen.dart';
import 'package:internative_assignment/src/screens/login_screen.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case "/home":
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => LandingScreen());
    }
  }

  static CupertinoPageRoute cupertinoRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return CupertinoPageRoute(builder: (context) => LoginScreen());
      case "/home":
        return CupertinoPageRoute(builder: (context) => HomeScreen());
      default:
        return CupertinoPageRoute(builder: (context) => LoginScreen());
    }
  }
}
