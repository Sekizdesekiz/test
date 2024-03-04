import 'dart:convert';
import 'dart:io';

import 'package:auth_project/data/info_post_api.dart';
import 'package:auth_project/models/customer_get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PostApi {
  static Future<CustomerGet> loginCustomer(
      String? userName, String? passWord, String check) async {
    var jsonResponse = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String url = "http://testapi.koddanismanlik.com/api/Auth/login";
    final response = await http.post(Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode(<dynamic, dynamic>{
          'username': userName,
          'password': passWord,
        }));
    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
      prefs.setString("token", jsonResponse["token"]);
      prefs.setString("username", userName!);
      prefs.setString("password", passWord!);
      prefs.setString("check", check);
      print("Kullanıcı Adı ${prefs.getString("username")}");
      InfoPostApi.getCustomerInfo(jsonResponse["token"]);
      return CustomerGet.fromJson(jsonResponse);
    } else {
      throw Exception('Failed');
    }
  }
}
