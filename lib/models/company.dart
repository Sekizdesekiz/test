// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  int? firmaind;
  String? firmakodu;
  String? firmaadi;
  String? firmakisaadi;

  Company({
    this.firmaind,
    this.firmakodu,
    this.firmaadi,
    this.firmakisaadi,
  });

  Company.fromJson(Map<String, dynamic> json) {
    firmaind = json["firmaind"];
    firmakodu = json["firmakodu"];
    firmaadi = json["firmaadi"];
    firmakisaadi = json["firmakisaadi"];
  }

  Map<String, dynamic> toJson() => {
        "firmaind": firmaind,
        "firmakodu": firmakodu,
        "firmaadi": firmaadi,
        "firmakisaadi": firmakisaadi,
      };
}
