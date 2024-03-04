class CustomerGet {
  int id = 0;
  String username = "";
  String lastname = "";
  String role = "";
  String token = "";

  CustomerGet(this.id, this.username, this.lastname, this.role, this.token);

  CustomerGet.fromJson(Map<String, dynamic> json) {
    {
      id = int.parse(json["id"].toString());
      username = json["username"].toString();
      lastname = json["lastname"].toString();
      role = json["role"].toString();
      token = json["token"].toString();
    }
  }
}
