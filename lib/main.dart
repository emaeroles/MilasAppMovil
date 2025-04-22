import 'package:flutter/material.dart';
import 'package:milas_app_movil/screens/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MilasApp",
      home: SplashScreen(),
    );
  }
}
