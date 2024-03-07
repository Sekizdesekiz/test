import 'package:auth_project/data/company_api.dart';
import 'package:auth_project/models/info.dart';
import 'package:auth_project/screen/compny_select_screen.dart';
import 'package:auth_project/screen/login_screen.dart';
import 'package:auth_project/widgets/drawer_widget.dart';
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
  void initState() {
    super.initState();
    _homePageTitle();
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      setState(() {
        pref = prefs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text("AnaSayfa"),
        backgroundColor: Colors.blue,
        actions: [
          ElevatedButton(
            onPressed: () {
              pref?.setString("token", "");
              pref?.commit();
              print(pref?.getString("token"));
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false);
            },
            child:
                const Text("Logout", style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: _homePageTitle(),
          ),
          Expanded(
            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    var response = CompanyApi.getCompanyInfo();
                    if (response != null) {
                      Navigator.pushNamed(context, "/productSearchPage");
                    }
                  },
                  child: const Text("Ürün Ara"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _homePageTitle() {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text("Firma Adı : ${pref?.getString("firmaAdi") ?? ""}")),
        Align(
            alignment: Alignment.centerLeft,
            child:
                Text("Firma Dönemi : ${pref?.getString("firmaDonem") ?? ""}")),
      ],
    );
  }
}
