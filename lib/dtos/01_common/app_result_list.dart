import 'package:milas_app_movil/core/app_states.dart';

class AppResult<T> {
  final AppStates state;
  final List<T>? data;

  AppResult({required this.state, required this.data});
}
