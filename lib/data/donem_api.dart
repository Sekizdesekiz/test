import 'dart:io';

import 'package:auth_project/constants/contant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DonemApi {
  static Future getDonemInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    String url = Contant.servisUrl;
    final response = await http.get(
      Uri.parse(url + "api/Auth/donemlist"),
      headers: <String, String>{
        "firmakodu" : ;
        HttpHeaders.authorizationHeader: "Bearer $token",
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
