import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/navigation_service.dart';
import 'package:milas_app_movil/core/routes.dart';
import 'package:milas_app_movil/providers/kioscos_provider.dart';
import 'package:provider/provider.dart';

class KioscosService {
  final NavigationService _navigationService;

  KioscosService(this._navigationService);

  void goTo(BuildContext context, String kioscoId) async {
    final provider = Provider.of<KioscosProvider>(context, listen: false);
    provider.addSelectedKiosco(id: kioscoId);
    _navigationService.navigateTo(Routes.kiosco);
  }
}
