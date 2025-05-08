import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:milas_app_movil/core/constants.dart';
import 'package:milas_app_movil/storage/local_storage.dart';

class ApiClient {
  Future<Response> get({required String path}) async {
    String? token = await LocalStorage.getToken();

    return await http.get(
      Uri.parse('${Config.apiUrl}$path'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<Response> post({required String path, String jsonBody = ""}) async {
    String? token = await LocalStorage.getToken();

    return await http.post(
      Uri.parse('${Config.apiUrl}$path'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonBody,
    );
  }

  Future<Response> put({required String path, String jsonBody = ""}) async {
    String? token = await LocalStorage.getToken();

    return await http.put(
      Uri.parse('${Config.apiUrl}$path'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonBody,
    );
  }

  Future<Response> patch({required String path, String jsonBody = ""}) async {
    String? token = await LocalStorage.getToken();

    return await http.patch(
      Uri.parse('${Config.apiUrl}$path'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonBody,
    );
  }

  Future<Response> delete({required String path}) async {
    String? token = await LocalStorage.getToken();

    return await http.delete(
      Uri.parse('${Config.apiUrl}$path'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
