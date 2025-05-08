import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/app_states.dart';
import 'package:milas_app_movil/core/routes.dart';
import 'package:milas_app_movil/core/styles.dart';
import 'package:milas_app_movil/main.dart';
import 'package:milas_app_movil/providers/login_provider.dart';
import 'package:milas_app_movil/widgets/text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    final TextEditingController usernameCtrl = TextEditingController();
    final TextEditingController passwordCtrl = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!provider.loading && provider.state == AppStates.authorized) {
        navigationService.replaceWith(Routes.home);
      }
    });

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
                  provider.login(
                    username: usernameCtrl.text.trim(),
                    password: passwordCtrl.text.trim(),
                  );
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
