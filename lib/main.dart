import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:milas_app_movil/core/navigation_service.dart';
import 'package:milas_app_movil/core/rutes.dart';
import 'package:milas_app_movil/providers/kioscos_provider.dart';
import 'package:milas_app_movil/repositories/kiosco_repo.dart';
import 'package:provider/provider.dart';

final NavigationService navigationService = NavigationService();
final KioscoRepo _kioscoRepo = KioscoRepo();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(
      MultiProvider(
        providers: [
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
    );
  }
}
