import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:auth_project/models/product.dart';
import 'package:http/http.dart' as http;

class ProductGetApi {
  static Future fetchPrudct(String search) async {
    var jsonResponse;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print("token3");
    print(token);
    print("search");
    print(search);
    Map<String, String> headers = {
      "stokadi": search,
      HttpHeaders.authorizationHeader: "Bearer $token",
    };

    final response = await http.get(
        Uri.parse("http://testapi.koddanismanlik.com/api/stok_/StokList"),
        headers: headers);

    print("responsecode");
    print(response.statusCode);
    return response;
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
      return Product.fromJson(jsonResponse);
    } else {
      throw Exception('Failed');
    }
  }
}
