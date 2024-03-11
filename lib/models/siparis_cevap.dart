import 'dart:convert';

SiparisCevap siparisCevapFromJson(String str) =>
    SiparisCevap.fromJson(jsonDecode(str));

class SiparisCevap {
  int? siparisId;
  int? cariHarId;
  List<int>? hareketIds;
  List<int>? rezervIds;
  List<int>? sipListIds;
  String? belgeNo;

  SiparisCevap(
      {this.siparisId,
      this.cariHarId,
      this.hareketIds,
      this.rezervIds,
      this.sipListIds,
      this.belgeNo});

  factory SiparisCevap.fromJson(Map<String, dynamic> json) => SiparisCevap(
        siparisId: json["siparisId"],
        cariHarId: json["cariHarId"],
        hareketIds: json["hareketIds"] == null
            ? []
            : List<int>.from(
                json["hareketIds"].map((x) => int.parse(x.toString()) as int)),
        rezervIds: json["rezervIds"] == null
            ? []
            : List<int>.from(
                json["rezervIds"].map((x) => int.parse(x.toString()) as int)),
        sipListIds: json["sipListIds"] == null
            ? []
            : List<int>.from(
                json["sipListIds"].map((x) => int.parse(x.toString()) as int)),
        belgeNo: json["belgeNo"],
      );
}
