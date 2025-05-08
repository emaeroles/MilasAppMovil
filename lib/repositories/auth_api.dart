import 'dart:convert';

import 'package:milas_app_movil/core/app_states.dart';
import 'package:milas_app_movil/dtos/01_common/app_result.dart';
import 'package:milas_app_movil/dtos/01_common/auth_output.dart';
import 'package:milas_app_movil/models/api_response.dart';
import 'package:milas_app_movil/dtos/01_common/auth_input.dart';
import 'package:milas_app_movil/dtos/user/get_user_input.dart';
import 'package:milas_app_movil/repositories/api_client.dart';

class AuthApi {
  final apiClient = ApiClient();

  Future<AppResult<AuthInput>> postLogin(AuthOutput authOutput) async {
    final response = await apiClient.post(
      path: "/api/auth/user",
      jsonBody: jsonEncode(authOutput.toJson()),
    );
    var decodedJson = jsonDecode(response.body);
    ApiResponse<AuthInput> apiResponse = ApiResponse<AuthInput>.fromJson(
      decodedJson,
      (data) => AuthInput.fromJson(data),
    );
    print(apiResponse.message);

    if (apiResponse.status == 200) {
      AppResult<AuthInput> appResult = AppResult(
        state: AppStates.authorized,
        data: apiResponse.data,
      );
      return appResult;
    }
    if (apiResponse.status == 401) {
      AppResult<AuthInput> appResult = AppResult(
        state: AppStates.unauthorized,
        data: apiResponse.data,
      );
      return appResult;
    }
    throw ("Error ${apiResponse.status}");
  }

  Future<AppResult<GetUserInput>> getAuth() async {
    final response = await apiClient.get(path: "/api/auth/check");
    var decodedJson = jsonDecode(response.body);
    ApiResponse<GetUserInput> apiResponse = ApiResponse<GetUserInput>.fromJson(
      decodedJson,
      (data) => GetUserInput.fromJson(data),
    );
    print(apiResponse.message);

    if (response.statusCode == 200) {
      AppResult<GetUserInput> appResult = AppResult(
        state: AppStates.authorized,
        data: apiResponse.data,
      );
      return appResult;
    }
    if (apiResponse.status == 401) {
      AppResult<GetUserInput> appResult = AppResult(
        state: AppStates.unauthorized,
        data: apiResponse.data,
      );
      return appResult;
    }
    throw ("Error ${apiResponse.status}");
  }
}
