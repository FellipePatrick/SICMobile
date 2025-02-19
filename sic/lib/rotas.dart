import 'package:flutter/material.dart';
import 'package:sic/ux/pages/home_page.dart';
import 'ux/pages/login_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
