import 'dart:convert';

class CustomerPost {
  late String username;
  late String password;

  CustomerPost(this.username, this.password);

  CustomerPost.fromJson(Map json) {
    username = json['username'];
    password = json['password'];
  }
}
