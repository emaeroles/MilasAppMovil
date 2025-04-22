import 'package:flutter/material.dart';
import 'package:milas_app_movil/models/api_response.dart';
import 'package:milas_app_movil/models/user.dart';
import 'package:milas_app_movil/screens/home_screen.dart';
import 'package:milas_app_movil/screens/login_screen.dart';
import 'package:milas_app_movil/services/auth_service.dart';
import 'package:milas_app_movil/storage/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUserStatus();
    });
  }

  void checkUserStatus() async {
    final token = await LocalStorage.getToken();
    if (!mounted) return;
    //final token = "Ema";
    if (token != null) {
      final isValid = await validateToken();
      if (!mounted) return;
      //final isValid = false;
      if (isValid) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  Future<bool> validateToken() async {
    AuthService authService = AuthService();
    ApiResponse<User>? apiResponse = await authService.getCheck();
    if (apiResponse != null) {
      if (apiResponse.status == 200) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Center(child: CircularProgressIndicator()));
  }
}
