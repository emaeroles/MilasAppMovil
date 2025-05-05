import 'package:flutter/material.dart';
import 'package:milas_app_movil/screens/home_screen.dart';
import 'package:milas_app_movil/screens/kiosco/kiosco_screen.dart';
import 'package:milas_app_movil/screens/kiosco/kioscos_screen.dart';
import 'package:milas_app_movil/screens/login_screen.dart';
import 'package:milas_app_movil/screens/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String kioscos = '/kioscos';
  static const String kiosco = '/kiosco';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _noAnimationRoute(const SplashScreen());
      case home:
        return _noAnimationRoute(const HomeScreen());
      case login:
        return _noAnimationRoute(const LoginScreen());
      case kioscos:
        return _noAnimationRoute(const KioscosScreen());
      case kiosco:
        return _noAnimationRoute(const KioscoScreen());
      default:
        return _noAnimationRoute(
          Builder(
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              );
            },
          ),
        );
    }
  }

  static PageRouteBuilder _noAnimationRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (_, __, ___, child) => child,
    );
  }
}
