import 'package:milas_app_movil/core/navigation_service.dart';
import 'package:milas_app_movil/core/rutes.dart';
import 'package:milas_app_movil/models/api_response.dart';
import 'package:milas_app_movil/models/user.dart';
import 'package:milas_app_movil/repositories/auth_repo.dart';
import 'package:milas_app_movil/storage/local_storage.dart';

class SplashService {
  final NavigationService _navigationService;

  SplashService(this._navigationService);

  void checkUserStatus() async {
    final token = await LocalStorage.getToken();
    if (token != null) {
      final isValid = await validateToken();
      if (isValid) {
        _navigationService.replaceWith(Routes.home);
      } else {
        _navigationService.replaceWith(Routes.login);
      }
    } else {
      _navigationService.replaceWith(Routes.login);
    }
  }

  Future<bool> validateToken() async {
    AuthRepo authRepo = AuthRepo();
    ApiResponse<User>? apiResponse = await authRepo.getCheck();
    if (apiResponse != null) {
      if (apiResponse.status == 200) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
