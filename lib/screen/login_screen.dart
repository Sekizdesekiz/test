import 'dart:convert';
import 'package:auth_project/data/info_post_api.dart';
import 'package:auth_project/data/post_api.dart';
import 'package:auth_project/models/customer_get.dart';
import 'package:auth_project/screen/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:auth_project/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/customer_post.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  bool isChecked = false;
  Future<CustomerPost>? customerLogin;
  List<CustomerGet>? customers;
  SharedPreferences? pref;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.teal],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    headerSection(),
                    textSection(),
                    checkboxSection(),
                    buttonSection(),
                  ],
                ),
        ),
      ),
    );
  }

  headerSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: const Text(
        "Giriş",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  textSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      margin: const EdgeInsets.only(
        top: 30.0,
      ),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white70),
            decoration: const InputDecoration(
              icon: Icon(Icons.email, color: Colors.white70),
              label: Text(
                "Email",
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70)),
              suffix: Icon(
                Icons.mail_outline,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.white,
            obscureText: true,
            style: const TextStyle(color: Colors.white70),
            decoration: const InputDecoration(
              icon: Icon(Icons.password, color: Colors.white70),
              label: Text(
                "Password",
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70)),
              suffix: Icon(
                Icons.password_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        onPressed: emailController.text == "" || passwordController.text == ""
            ? null
            : () {
                setState(() {
                  _isLoading = true;
                });
                signIn(emailController.text, passwordController.text);
              },
        child: const Text(
          "Sign In",
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  txtMail(String title, IconData icon) {
    return TextField(
      controller: emailController,
      style: const TextStyle(color: Colors.white70),
      decoration: InputDecoration(
          hintText: title,
          hintStyle: const TextStyle(color: Colors.white70),
          icon: Icon(icon)),
    );
  }

  txtPassword(String title, IconData icon) {
    return TextField(
      controller: passwordController,
      obscureText: true,
      style: const TextStyle(color: Colors.white70),
      decoration: InputDecoration(
          hintText: title,
          hintStyle: const TextStyle(color: Colors.white70),
          icon: Icon(icon)),
    );
  }

  signIn(String email, password) async {
    String check = isChecked.toString();
    var response = PostApi.loginCustomer(email, password, check);
    if (response != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          (Route<dynamic> route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  checkboxSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text("Beni Hatırla"),
          Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              }),
        ],
      ),
    );
  }
}
