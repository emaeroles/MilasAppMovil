import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:milas_app_movil/models/api_response.dart';
import 'package:milas_app_movil/models/user.dart';

class Repository {
  Future<ApiResponse<User>?> postLogin(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://milasapp.emaeroles.dev/api/auth/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      ApiResponse<User> apiResponse = ApiResponse<User>.fromJson(
        decodedJson,
        (data) => User.fromJson(data),
      );
      return apiResponse;
    } else {
      return null;
      //throw Exception('Failed to load post');
    }
  }
}
