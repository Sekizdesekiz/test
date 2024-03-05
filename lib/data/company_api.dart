import 'dart:convert';
import 'dart:io';
import 'package:auth_project/models/company.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auth_project/constants/contant.dart';
import 'package:http/http.dart' as http;

class CompanyApi {
  static Future getCompanyInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    String url = Contant.servisUrl;
    final response = await http.get(
      Uri.parse(url + "api/Auth/Firmalist"),
      headers: <String, String>{
        HttpHeaders.authorizationHeader: "Bearer $token",
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
