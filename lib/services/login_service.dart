import 'package:milas_app_movil/core/navigation_service.dart';
import 'package:milas_app_movil/core/rutes.dart';
import 'package:milas_app_movil/models/api_response.dart';
import 'package:milas_app_movil/models/token.dart';
import 'package:milas_app_movil/models/user.dart';
import 'package:milas_app_movil/repositories/auth_repo.dart';
import 'package:milas_app_movil/storage/local_storage.dart';

class LoginService {
  final NavigationService _navigationService;

  LoginService(this._navigationService);

  void login(String username, String password) async {
    ApiResponse<Token>? apiResponseToken;
    ApiResponse<User>? apiResponseUser;
    AuthRepo authRepo = AuthRepo();

    apiResponseToken = await authRepo.postLogin(username, password);

    if (apiResponseToken != null && apiResponseToken.status == 200) {
      await LocalStorage.saveToken(apiResponseToken.data.token);

      apiResponseUser = await authRepo.getCheck();
      if (apiResponseUser != null) {
        await LocalStorage.saveUserId(apiResponseUser.data.id);
      }

      _navigationService.replaceWith(Routes.home);
    }
  }
}
