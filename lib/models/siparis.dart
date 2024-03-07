// To parse this JSON data, do
//
//     final siparis = siparisFromJson(jsonString);

import 'dart:convert';

Siparis siparisFromJson(String str) => Siparis.fromJson(json.decode(str));

String siparisToJson(Siparis data) => json.encode(data.toJson());

class Siparis {
  bool? alinanmi;
  SiparisClass? siparis;
  List<Hareketler>? hareketler;

  Siparis({
    this.alinanmi,
    this.siparis,
    this.hareketler,
  });

  factory Siparis.fromJson(Map<String, dynamic> json) => Siparis(
        alinanmi: json["alinanmi"],
        siparis: json["Siparis"] == null
            ? null
            : SiparisClass.fromJson(json["Siparis"]),
        hareketler: json["hareketler"] == null
            ? []
            : List<Hareketler>.from(
                json["hareketler"]!.map((x) => Hareketler.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "alinanmi": alinanmi,
        "Siparis": siparis?.toJson(),
        "hareketler": hareketler == null
            ? []
            : List<dynamic>.from(hareketler!.map((x) => x.toJson())),
      };
}

class Hareketler {
  int? miktar;
  int? kdv;
  int? stokno;
  int? fiyati;
  String? birim;
  String? malincinsi;
  String? stokkodu;
  double? isk1;
  double? isk2;
  double? isk3;

  Hareketler({
    this.miktar,
    this.kdv,
    this.stokno,
    this.fiyati,
    this.birim,
    this.malincinsi,
    this.stokkodu,
    this.isk1,
    this.isk2,
    this.isk3,
  });

  Hareketler.fromJson(Map<String, dynamic> json) {
    miktar = json["MIKTAR"];
    kdv = json["KDV"];
    stokno = json["STOKNO"];
    fiyati = json["FIYATI"];
    birim = json["BIRIM"];
    malincinsi = json["MALINCINSI"];
    stokkodu = json["STOKKODU"];
    isk1 = json["Isk1"]?.toDouble();
    isk2 = json["Isk2"]?.toDouble();
    isk3 = json["Isk3"]?.toDouble();
  }

  Map<String, dynamic> toJson() => {
        "MIKTAR": miktar,
        "KDV": kdv,
        "STOKNO": stokno,
        "FIYATI": fiyati,
        "BIRIM": birim,
        "MALINCINSI": malincinsi,
        "STOKKODU": stokkodu,
        "Isk1": isk1,
        "Isk2": isk2,
        "Isk3": isk3,
      };
}

class SiparisClass {
  int? firmano;
  int? userno;
  DateTime? tarih;
  bool? kdv;
  double? alt1;
  double? alt2;
  double? alt3;
  double? alt4;

  SiparisClass({
    this.firmano,
    this.userno,
    this.tarih,
    this.kdv,
    this.alt1,
    this.alt2,
    this.alt3,
    this.alt4,
  });

  SiparisClass.fromJson(Map<String, dynamic> json) {
    firmano = json["FIRMANO"];
    userno = json["USERNO"];
    tarih = json["TARIH"] == null ? null : DateTime.parse(json["TARIH"]);
    kdv = json["KDV"];
    alt1 = json["Alt1"]?.toDouble();
    alt2 = json["Alt2"]?.toDouble();
    alt3 = json["Alt3"]?.toDouble();
    alt4 = json["Alt4"]?.toDouble();
  }

  Map<String, dynamic> toJson() => {
        "FIRMANO": firmano,
        "USERNO": userno,
        "TARIH":
            "${tarih!.year.toString().padLeft(4, '0')}-${tarih!.month.toString().padLeft(2, '0')}-${tarih!.day.toString().padLeft(2, '0')}",
        "KDV": kdv,
        "Alt1": alt1,
        "Alt2": alt2,
        "Alt3": alt3,
        "Alt4": alt4,
      };
}
