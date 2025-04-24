import 'package:milas_app_movil/core/navigation_service.dart';
import 'package:milas_app_movil/core/rutes.dart';
import 'package:milas_app_movil/storage/local_storage.dart';

class HomeService {
  final NavigationService _navigationService;

  HomeService(this._navigationService);

  void logout() {
    LocalStorage.clearToken();
    LocalStorage.clearUserId();
    _navigationService.replaceWith(Routes.login);
  }
}
