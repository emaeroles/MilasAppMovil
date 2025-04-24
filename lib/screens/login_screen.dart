import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/styles.dart';
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
      backgroundColor: Color(0xFF242424),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "MilasApp",
                style: Styles.textStyle.copyWith(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100),
              TextField(
                style: Styles.textStyle.copyWith(fontSize: 16),
                cursorColor: Color(0xFFe3e3e3),
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: Styles.textStyle.copyWith(fontSize: 20),
                  filled: true,
                  fillColor: Color(0xFF3b3b3b),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF858585)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 1.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  username = value;
                },
              ),
              SizedBox(height: 25),
              TextField(
                obscureText: true,
                style: Styles.textStyle.copyWith(fontSize: 16),
                cursorColor: Color(0xFFe3e3e3),
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: Styles.textStyle.copyWith(fontSize: 20),
                  filled: true,
                  fillColor: Color(0xFF3b3b3b),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF858585)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 1.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 25),
              OutlinedButton(
                style: Styles.buttonStyle,
                onPressed: () {
                  loginService.login(username, password);
                },
                child: Text(
                  "Login",
                  style: Styles.textStyle.copyWith(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
