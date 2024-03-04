import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:auth_project/models/product.dart';
import 'package:http/http.dart' as http;

class ProductGetApi {
  static Future fetchPrudct(String search) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> headers = {
      "stokadi": search,
      HttpHeaders.authorizationHeader: "Bearer $token",
    };

    return http.get(
        Uri.parse("http://testapi.koddanismanlik.com/api/stok_/StokList"),
        headers: headers);
  }
}
