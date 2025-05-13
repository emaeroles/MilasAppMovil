import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/app_states.dart';
import 'package:milas_app_movil/core/routes.dart';
import 'package:milas_app_movil/core/styles.dart';
import 'package:milas_app_movil/main.dart';
import 'package:milas_app_movil/providers/login_provider.dart';
import 'package:milas_app_movil/services/login_service.dart';
import 'package:milas_app_movil/widgets/info_modal.dart';
import 'package:milas_app_movil/widgets/spinner_modal.dart';
import 'package:milas_app_movil/widgets/text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> _formState;
  late TextEditingController _usernameCtrl;
  late TextEditingController _passwordCtrl;
  late LoginService _loginService;

  @override
  void initState() {
    super.initState();
    _formState = GlobalKey<FormState>();
    _usernameCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
    _loginService = LoginService();
  }

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!provider.loading && provider.state == AppStates.authorized) {
        Navigator.of(context, rootNavigator: true).pop();
        navigationService.replaceWith(Routes.home);
        provider.clearState();
      } else if (!provider.loading &&
          provider.state == AppStates.unauthorized) {
        Navigator.of(context, rootNavigator: true).pop();
        showInfoDialog(
          context: context,
          title: 'Error de autenticación',
          message: 'El usuario o la contraseña no son válidos.',
        );
      }
    });

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Form(
            key: _formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "MilasApp",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 100),
                AppTextField(
                  label: "Username",
                  controller: _usernameCtrl,
                  validator: (value) => _loginService.usernameValid(value),
                ),
                SizedBox(height: 25),
                AppTextField(
                  label: "Password",
                  controller: _passwordCtrl,
                  validator: (value) => _loginService.passwordValid(value),
                  obscureText: true,
                ),
                SizedBox(height: 25),
                OutlinedButton(
                  style: Styles.min200ButtonStyle,
                  onPressed: () {
                    if (_formState.currentState!.validate()) {
                      showLoadingDialog(context: context);
                      provider.login(
                        username: _usernameCtrl.text.trim(),
                        password: _passwordCtrl.text.trim(),
                      );
                    }
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
