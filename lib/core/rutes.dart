import 'package:flutter/material.dart';
import 'package:milas_app_movil/screens/home_screen.dart';
import 'package:milas_app_movil/screens/login_screen.dart';
import 'package:milas_app_movil/screens/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
