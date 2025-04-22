import 'package:flutter/material.dart';
import 'package:milas_app_movil/models/api_response.dart';
import 'package:milas_app_movil/models/token.dart';
import 'package:milas_app_movil/screens/home_screen.dart';
import 'package:milas_app_movil/services/auth_service.dart';
import 'package:milas_app_movil/storage/local_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _login(String username, String password) async {
    ApiResponse<Token>? apiResponse;
    AuthService authService = AuthService();

    apiResponse = await authService.postLogin(username, password);
    if (!mounted) return;

    if (apiResponse != null) {
      if (apiResponse.status == 200) {
        await LocalStorage.saveToken(apiResponse.data.token);
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    }
  }

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
                  _login(username, password);
                },
                child: Text("Login"),
              ),
            ],
            //CircularProgressIndicator(color: Colors.grey.shade900),
          ),
        ),
      ),
    );
  }
}
