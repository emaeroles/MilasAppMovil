import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:milas_app_movil/models/api_response.dart';
import 'package:milas_app_movil/models/kiosco.dart';
import 'package:milas_app_movil/storage/local_storage.dart';

class KioscoRepo {
  Future<List<Kiosco>> getKioscos() async {
    String? token = await LocalStorage.getToken();
    String? userId = await LocalStorage.getUserId();
    final response = await http.get(
      Uri.parse(
        'https://milasapp.emaeroles.dev/api/kiosco/$userId/get-actives',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      ApiResponse<List<Kiosco>> apiResponse =
          ApiResponse<List<Kiosco>>.fromJson(
            decodedJson,
            (data) =>
                (data as List).map((item) => Kiosco.fromJson(item)).toList(),
          );
      return apiResponse.data;
    } else {
      //return null;
      return throw Exception('Failed to load post');
    }
  }
}
