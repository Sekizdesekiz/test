class Product {
  late int ind;
  late double kuralis;
  late double kursatis;
  late double kdvdahilsatisfiyatI1;
  late double kdvharicsatisfiyatI1;
  late double kdvdahilalisfiyati;
  late double kdvdahilmaliyet;
  late String stokkudu;
  late String malincinsi;
  late String barcode;
  late String pB1;
  late String dovizcinsi;
  late String stokno;
  late String koD9;
  late String resim;
  late double karoranI1;
  late int stoktipi;
  late String giren;
  late String cikan;
  late String envanter;
  late double kdvharicalisfiyati;
  late double satisfiyatI1;
  late int aliskdvorani;
  late double kdv;
  late double kdvharicmaliyet;

  Product(
      this.ind,
      this.kuralis,
      this.kursatis,
      this.kdvdahilsatisfiyatI1,
      this.kdvharicsatisfiyatI1,
      this.kdvdahilalisfiyati,
      this.kdvdahilmaliyet,
      this.stokkudu,
      this.malincinsi,
      this.barcode,
      this.pB1,
      this.dovizcinsi,
      this.stokno,
      this.koD9,
      this.resim,
      this.karoranI1,
      this.stoktipi,
      this.giren,
      this.cikan,
      this.envanter,
      this.kdvharicalisfiyati,
      this.satisfiyatI1,
      this.aliskdvorani,
      this.kdv,
      this.kdvharicmaliyet);

  Product.fromJson(Map<String, dynamic> json) {
    ind = int.parse(json["ind"].toString());
    kuralis = double.parse(json["kuralis"].toString());
    kursatis = double.parse(json["kursatis"].toString());
    kdvdahilsatisfiyatI1 =
        double.parse(json["kdvdahilsatisfiyatI1"].toString());
    kdvharicsatisfiyatI1 =
        double.parse(json["kdvharicsatisfiyatI1"].toString());
    kdvdahilalisfiyati = double.parse(json["kdvdahilalisfiyati"].toString());
    kdvdahilmaliyet = double.parse(json["kdvdahilmaliyet"].toString());
    stokkudu = json["stokkudu"].toString();
    malincinsi = json["malincinsi"].toString();
    barcode = json["barcode"].toString();
    pB1 = json["pB1"].toString();
    dovizcinsi = json["dovizcinsi"].toString();
    stokno = json["stokno"].toString();
    koD9 = json["koD9"].toString();
    resim = json["resim"].toString();
    karoranI1 = double.parse(json["karoranI1"].toString());
    stoktipi = int.parse(json["stoktipi"].toString());
    giren = json["giren"].toString();
    cikan = json["cikan"].toString();
    envanter = json["envanter"].toString();
    kdvharicalisfiyati = double.parse(json["kdvharicalisfiyati"].toString());
    satisfiyatI1 = double.parse(json["satisfiyatI1"].toString());
    aliskdvorani = int.parse(json["aliskdvorani"].toString());
    kdv = double.parse(json["kdv"].toString());
    kdvharicmaliyet = double.parse(json["kdvharicmaliyet"].toString());
  }

  Map toJson() {
    return {
      "ind": ind,
      "kuralis": kuralis,
      "kursatis": kursatis,
      "kdvdahilsatisfiyatI1": kdvdahilsatisfiyatI1,
      "kdvharicsatisfiyatI1": kdvharicsatisfiyatI1,
      "kdvdahilalisfiyati": kdvdahilalisfiyati,
      "kdvdahilmaliyet": kdvdahilmaliyet,
      "stokkudu": stokkudu,
      "malincinsi": malincinsi,
      "barcode": barcode,
      "pB1": pB1,
      "dovizcinsi": dovizcinsi,
      "stokno": stokno,
      "koD9": koD9,
      "resim": resim,
      "karoranI1": karoranI1,
      "stoktipi": stoktipi,
      "giren": giren,
      "cikan": cikan,
      "envanter": envanter,
      "kdvharicalisfiyati": kdvharicalisfiyati,
      "satisfiyatI1": satisfiyatI1,
      "aliskdvorani": aliskdvorani,
      "kdv": kdv,
      "kdvharicmaliyet": kdvharicmaliyet,
    };
  }
}
