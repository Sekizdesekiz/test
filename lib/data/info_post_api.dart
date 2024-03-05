import 'dart:convert';
import 'dart:io';

import 'package:auth_project/models/info.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InfoPostApi {
  static Future<Info> getCustomerInfo() async {
    var jsonResponse = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print("token2");
    print(token);
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
    print(response.statusCode);
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
