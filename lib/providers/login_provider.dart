import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/app_states.dart';
import 'package:milas_app_movil/dtos/01_common/auth_output.dart';
import 'package:milas_app_movil/repositories/auth_api.dart';
import 'package:milas_app_movil/storage/local_storage.dart';

class LoginProvider with ChangeNotifier {
  final AuthApi _authApi;

  LoginProvider(this._authApi);

  AppStates _state = AppStates.empty;
  bool _loading = false;
  String? _error;

  AppStates get state => _state;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final authOutput = AuthOutput(username: username, password: password);
      final appResultLogin = await _authApi.postLogin(authOutput);
      if (appResultLogin.data != null) {
        await LocalStorage.saveToken(appResultLogin.data!.token);
        //await LocalStorage.saveUserId(appResultUser.data!.id);
      }
      _state = appResultLogin.state;

      // TODO: provisorio hasta hacer correctamente estos 2 endpoints en el back
      final appResultUser = await _authApi.getAuth();
      await LocalStorage.saveUserId(appResultUser.data!.id);
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void clearState() {
    _state = AppStates.empty;
  }
}
