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
  late int stokno;
  late String koD9;
  late String resim;
  late double karoranI1;
  late int stoktipi;
  late double giren;
  late double cikan;
  late double envanter;
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

  Product.fromJson(Map json) {
    ind = json["ind"];
    kuralis = json["kuralis"];
    kursatis = json["kursatis"];
    kdvdahilsatisfiyatI1 = json["kdvdahilsatisfiyatI1"];
    kdvharicsatisfiyatI1 = json["kdvharicsatisfiyatI1"];
    kdvdahilalisfiyati = json["kdvdahilalisfiyati"];
    kdvdahilmaliyet = json["kdvdahilmaliyet"];
    stokkudu = json["stokkudu"].toString();
    malincinsi = json["malincinsi"];
    barcode = json["barcode"];
    pB1 = json["pB1"];
    dovizcinsi = json["dovizcinsi"];
    stokno = json["stokno"];
    koD9 = json["koD9"].toString();
    resim = json["resim"].toString();
    karoranI1 = json["karoranI1"];
    stoktipi = json["stoktipi"];
    giren = json["giren"];
    cikan = json["cikan"];
    envanter = json["envanter"];
    kdvharicalisfiyati = json["kdvharicalisfiyati"];
    satisfiyatI1 = json["satisfiyatI1"];
    aliskdvorani = json["aliskdvorani"];
    kdv = json["kdv"];
    kdvharicmaliyet = json["kdvharicmaliyet"];
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
