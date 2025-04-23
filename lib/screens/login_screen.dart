import 'package:flutter/material.dart';
import 'package:milas_app_movil/main.dart';
import 'package:milas_app_movil/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginService loginService = LoginService(navigationService);

  @override
  Widget build(BuildContext context) {
    String username = "";
    String password = "";

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Milas App",
                style: TextStyle(
                  fontFamily: "monospace",
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 100),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                onChanged: (value) {
                  username = value;
                },
              ),
              SizedBox(height: 25),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 25),
              OutlinedButton(
                onPressed: () {
                  loginService.login(username, password);
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
