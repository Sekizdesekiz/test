import 'dart:convert';
import 'dart:io';

import 'package:auth_project/models/customer_get.dart';
import 'package:auth_project/models/customer_post.dart';
import 'package:auth_project/models/info.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InfoPostApi {
  static Future<Info> getCustomerInfo(String token) async {
    var jsonResponse = null;

    final response = await http.post(
      Uri.parse("http://testapi.koddanismanlik.com/api/auth/firmadonemsec"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer $token"
      },
      body: jsonEncode(<String, String>{
        'firma': "F0101",
        'donem': "D0001",
      }),
    );
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
      return Info.fromJson(jsonResponse);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('InfoPostFail');
    }
  }
}
