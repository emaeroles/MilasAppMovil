import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/navigation_service.dart';
import 'package:milas_app_movil/core/routes.dart';
import 'package:milas_app_movil/providers/kioscos_provider.dart';
import 'package:milas_app_movil/storage/local_storage.dart';
import 'package:provider/provider.dart';

class HomeService {
  final NavigationService _navigationService;

  HomeService(this._navigationService);

  void logout() {
    LocalStorage.clearToken();
    LocalStorage.clearUserId();
    _navigationService.replaceWith(Routes.login);
  }

  void addKioscos(BuildContext context) {
    final provider = Provider.of<KioscosProvider>(context, listen: false);
    provider.addKioscos();
  }
}
