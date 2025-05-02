import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/styles.dart';
import 'package:milas_app_movil/main.dart';
import 'package:milas_app_movil/services/login_service.dart';
import 'package:milas_app_movil/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginService loginService = LoginService(navigationService);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameCtrl = TextEditingController();
    final TextEditingController passwordCtrl = TextEditingController();

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
              AppTextField(label: "Username", controller: usernameCtrl),
              SizedBox(height: 25),
              AppTextField(
                label: "Password",
                controller: passwordCtrl,
                obscureText: true,
              ),
              SizedBox(height: 25),
              OutlinedButton(
                style: Styles.buttonStyle,
                onPressed: () {
                  loginService.login(usernameCtrl.text, passwordCtrl.text);
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
