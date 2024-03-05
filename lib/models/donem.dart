// To parse this JSON data, do
//
//     final donem = donemFromJson(jsonString);

import 'dart:convert';

Donem donemFromJson(String str) => Donem.fromJson(json.decode(str));

String donemToJson(Donem data) => json.encode(data.toJson());

class Donem {
  int? donemind;
  int? firmaind;
  String? donemkod;
  int? donemadi;

  Donem({
    this.donemind,
    this.firmaind,
    this.donemkod,
    this.donemadi,
  });

  Donem.fromJson(Map<String, dynamic> json) {
    donemind = json["donemind"];
    firmaind = json["firmaind"];
    donemkod = json["donemkod"];
    donemadi = json["donemadi"];
  }

  Map<String, dynamic> toJson() => {
        "donemind": donemind,
        "firmaind": firmaind,
        "donemkod": donemkod,
        "donemadi": donemadi,
      };
}
