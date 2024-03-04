import 'dart:convert';
import 'dart:io';

import 'package:auth_project/models/customer_get.dart';
import 'package:auth_project/models/customer_post.dart';
import 'package:auth_project/models/info.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InfoGetApi {
  Future<CustomerGet> getCustomerInfo() async {
    var jsonResponse = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    final response = await http.get(
      Uri.parse("http://testapi.koddanismanlik.com/api/auth/firmadonemsec"),
      headers: <String, String>{
        HttpHeaders.authorizationHeader: token!,
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
      Info.fromJson(jsonResponse as Map<String, dynamic>);
      return CustomerGet.fromJson(json as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load AAA');
    }
  }
}
