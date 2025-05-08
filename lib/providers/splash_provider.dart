import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/app_states.dart';
import 'package:milas_app_movil/repositories/auth_api.dart';
import 'package:milas_app_movil/storage/local_storage.dart';

class SplashProvider with ChangeNotifier {
  final AuthApi _authApi;

  SplashProvider(this._authApi);

  AppStates _state = AppStates.unauthorized;
  bool _loading = false;
  String? _error;

  AppStates get state => _state;
  bool get loading => _loading;
  String? get error => _error;

  void inLoad() {
    _loading = true;
  }

  Future<void> checkAuth() async {
    _loading = true;
    _error = null;
    notifyListeners();

    final token = await LocalStorage.getToken();
    if (token == null) {
      _state = AppStates.unauthorized;
      _loading = false;
      notifyListeners();
    } else {
      try {
        final appResult = await _authApi.getAuth();
        _state = appResult.state;
      } catch (e) {
        _error = e.toString();
      } finally {
        _loading = false;
        notifyListeners();
      }
    }
  }
}
