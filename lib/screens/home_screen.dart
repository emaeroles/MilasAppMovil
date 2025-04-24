import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/styles.dart';
import 'package:milas_app_movil/main.dart';
import 'package:milas_app_movil/services/home_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeService homeService = HomeService(navigationService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF242424),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home", style: Styles.textStyle.copyWith(fontSize: 30)),
            SizedBox(height: 100),
            OutlinedButton(
              style: Styles.buttonStyle,
              onPressed: () {
                homeService.logout();
              },
              child: Text(
                "Logout",
                style: Styles.textStyle.copyWith(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
