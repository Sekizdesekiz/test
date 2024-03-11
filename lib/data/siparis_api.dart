import 'dart:convert';
import 'dart:io';

import 'package:auth_project/constants/contant.dart';
import 'package:auth_project/data/info_post_api.dart';
import 'package:auth_project/models/siparis.dart';
import 'package:auth_project/models/siparis_cevap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SiparisApi {
  static Future<SiparisCevap> postSiparis() async {
    var jsonResponse = null;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    String url = Contant.servisUrl;
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.contentTypeHeader: "application/json"
    };
    final response = await http.post(Uri.parse(url + "api/siparis/PostAsync"),
        headers: headers,
        body: jsonEncode({
          "alinanmi": true,
          "Siparis": {
            "FIRMANO": 123,
            "USERNO": 2,
            "TARIH": "2022-03-13",
            "KDV": true,
            "Alt1": 2.5,
            "Alt2": 2.5,
            "Alt3": 2.5,
            "Alt4": 2.5
          },
          "hareketler": [
            {
              "MIKTAR": 3,
              "KDV": 18,
              "STOKNO": 100,
              "FIYATI": 150,
              "BIRIM": "ADET",
              "MALINCINSI": "STOK",
              "STOKKODU": "STOK",
              "Isk1": 2.5,
              "Isk2": 2.5,
              "Isk3": 2.5
            },
            {
              "MIKTAR": 5,
              "KDV": 18,
              "STOKNO": 165,
              "FIYATI": 20,
              "BIRIM": "ADET",
              "MALINCINSI": "HİZMET",
              "STOKKODU": "HİZMET",
              "Isk1": 2.5,
              "Isk2": 2.5,
              "Isk3": 2.5
            }
          ]
        }));
    jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    var result = SiparisCevap.fromJson(jsonResponse);
    return result;
  }
}
