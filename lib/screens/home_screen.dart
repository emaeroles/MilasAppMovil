import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/routes.dart';
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
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: Styles.min200ButtonStyle,
              onPressed: () {},
              child: Text("Reparto"),
            ),
            SizedBox(height: 50),
            OutlinedButton(
              style: Styles.min200ButtonStyle,
              onPressed: () {
                homeService.addKioscos(context);
                navigationService.navigateTo(Routes.kioscos);
              },
              child: Text("Kioscos"),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              style: Styles.min200ButtonStyle,
              onPressed: () {},
              child: Text("Productos"),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              style: Styles.min200ButtonStyle,
              onPressed: () {},
              child: Text("Insumos"),
            ),
            SizedBox(height: 50),
            OutlinedButton(
              style: Styles.min200ButtonStyle,
              onPressed: () {
                homeService.logout();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
