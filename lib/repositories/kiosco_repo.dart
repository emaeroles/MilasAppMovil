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
      headers: <String, String>{'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      ApiResponse<List<Kiosco>> apiResponse =
          ApiResponse<List<Kiosco>>.fromJson(
            decodedJson,
            (data) =>
                (data as List).map((item) => Kiosco.fromJson(item)).toList(),
          );
      apiResponse.data.sort((a, b) => a.name.compareTo(b.name));
      return apiResponse.data;
    } else {
      //return null;
      return [];
    }
  }

  Future<List<Kiosco>> getInactivesKioscos() async {
    String? token = await LocalStorage.getToken();
    String? userId = await LocalStorage.getUserId();
    final response = await http.get(
      Uri.parse(
        'https://milasapp.emaeroles.dev/api/kiosco/$userId/get-inactives',
      ),
      headers: <String, String>{'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      ApiResponse<List<Kiosco>> apiResponse =
          ApiResponse<List<Kiosco>>.fromJson(
            decodedJson,
            (data) =>
                (data as List).map((item) => Kiosco.fromJson(item)).toList(),
          );
      apiResponse.data.sort((a, b) => a.name.compareTo(b.name));
      return apiResponse.data;
    } else {
      //return null;
      return [];
    }
  }

  Future<bool> addKiosco(Kiosco kiosco) async {
    String? token = await LocalStorage.getToken();
    String? userId = await LocalStorage.getUserId();
    final response = await http.post(
      Uri.parse('https://milasapp.emaeroles.dev/api/kiosco/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        "name": kiosco.name,
        "manager": kiosco.manager,
        "phone": kiosco.phone,
        "address": kiosco.address,
        "userId": userId!,
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateKiosco(Kiosco kiosco) async {
    String? token = await LocalStorage.getToken();
    final response = await http.patch(
      Uri.parse('https://milasapp.emaeroles.dev/api/kiosco/update'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        "id": kiosco.id,
        "name": kiosco.name,
        "manager": kiosco.manager,
        "phone": kiosco.phone,
        "address": kiosco.address,
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> toggleActiveKiosco(String id) async {
    String? token = await LocalStorage.getToken();
    final response = await http.post(
      Uri.parse('https://milasapp.emaeroles.dev/api/kiosco/$id/toggle-active'),
      headers: <String, String>{'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
