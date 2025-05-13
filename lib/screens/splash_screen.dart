import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/routes.dart';
import 'package:milas_app_movil/core/app_states.dart';
import 'package:milas_app_movil/main.dart';
import 'package:milas_app_movil/providers/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = Provider.of<SplashProvider>(context, listen: false);
      provider.inLoad();
      provider.checkAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SplashProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!provider.loading) {
        if (provider.state == AppStates.authorized) {
          navigationService.replaceWith(Routes.home);
        } else {
          navigationService.replaceWith(Routes.login);
        }
      }
    });

    return Scaffold(body: const Center(child: CircularProgressIndicator()));
  }
}
