import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:milas_app_movil/core/app_theme.dart';
import 'package:milas_app_movil/core/navigation_service.dart';
import 'package:milas_app_movil/core/routes.dart';
import 'package:milas_app_movil/providers/kioscos_provider.dart';
import 'package:milas_app_movil/providers/login_provider.dart';
import 'package:milas_app_movil/providers/splash_provider.dart';
import 'package:milas_app_movil/repositories/auth_api.dart';
import 'package:milas_app_movil/repositories/kiosco_repo.dart';
import 'package:provider/provider.dart';

final NavigationService navigationService = NavigationService();
final KioscoRepo _kioscoRepo = KioscoRepo();
final AuthApi _authApi = AuthApi();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SplashProvider(_authApi)),
          ChangeNotifierProvider(create: (_) => LoginProvider(_authApi)),
          ChangeNotifierProvider(create: (_) => KioscosProvider(_kioscoRepo)),
        ],
        child: const MainApp(),
      ),
    );
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MilasApp",
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.splash,
      theme: AppTheme.darkTheme,
    );
  }
}
