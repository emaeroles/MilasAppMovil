import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:milas_app_movil/core/navigation_service.dart';
import 'package:milas_app_movil/core/rutes.dart';

final NavigationService navigationService = NavigationService();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(const MainApp());
  });
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MilasApp",
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.splash,
    );
  }
}
