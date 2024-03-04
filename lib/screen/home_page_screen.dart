import 'package:auth_project/models/info.dart';
import 'package:auth_project/screen/login_screen.dart';
import 'package:auth_project/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences? pref;
  late List<Info> infos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnaSayfa"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              pref?.setString("token", "");
              pref?.commit();
              print(pref?.getString("token"));
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginPage()),
                  (Route<dynamic> route) => false);
            },
            child: Text("Logout", style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(child: ProductListWidget()),
          ],
        ),
      ),
    );
  }
}
