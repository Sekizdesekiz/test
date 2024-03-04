class Info {
  int id = 0;
  String userName = "";
  String loginKey = "";
  String loginTimeout = "";
  String girisZamani = "";
  String sonIslemZamani = "";
  String loginStatus = "";
  String firma = "";
  String donem = "";

  Info(
    this.id,
    this.userName,
    this.loginKey,
    this.loginTimeout,
    this.girisZamani,
    this.sonIslemZamani,
    this.loginStatus,
    this.firma,
    this.donem,
  );

  Info.fromJson(Map<String, dynamic> json) {
    {
      id = int.parse(json["id"].toString());
      userName = json['username'].toString();
      loginKey = json['loginKey'];
      loginTimeout = json['loginTimeout'];
      girisZamani = json['girisZamani'];
      sonIslemZamani = json['sonIslemZamani'];
      loginStatus = json['loginStatus'].toString();
      firma = json['firma'];
      donem = json['donem'];
    }
  }
}
