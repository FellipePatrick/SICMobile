import 'package:flutter/material.dart';
import 'package:sic/ux/pages/home_page.dart';
import 'package:sic/ux/pages/tutorial_page.dart';
import 'ux/pages/login_page.dart';
import 'ux/pages/processo_page.dart';
import 'ux/pages/result_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String processo = '/processo';
  static const String resultado = '/resultado';
  static const String tutorial = '/tutorial';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case processo:
        return MaterialPageRoute(builder: (_) => ProcessoPage());
      case resultado:
        return MaterialPageRoute(builder: (_) => ResultPage());
      case tutorial:
        return MaterialPageRoute(builder: (_) => TutorialPage());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
