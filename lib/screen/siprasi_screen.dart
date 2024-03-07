import 'package:auth_project/data/company_api.dart';
import 'package:auth_project/data/info_post_api.dart';
import 'package:auth_project/data/siparis_api.dart';
import 'package:auth_project/screen/login_screen.dart';
import 'package:auth_project/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SiparisPage extends StatelessWidget {
  SharedPreferences? pref;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("Ayarlar"),
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
          const Text("Sipariş."),
          const Row(
            children: [
              Text("Firma No : "),
              Text("123"),
            ],
          ),
          const Row(
            children: [
              Text("UserNo : "),
              Text("2"),
            ],
          ),
          const Row(
            children: [
              Text("Tarih : "),
              Text("2022-03-13"),
            ],
          ),
          const Row(
            children: [
              Text("Alt1 : "),
              Text("2.5"),
            ],
          ),
          const Row(
            children: [
              Text("Alt2 : "),
              Text("2.5"),
            ],
          ),
          const Row(
            children: [
              Text("Alt3 : "),
              Text("2.5"),
            ],
          ),
          const Row(
            children: [
              Text("Alt4 : "),
              Text("2.5"),
            ],
          ),
          const Text("Hareketler."),
          const Row(
            children: [
              Text("Miktar :"),
              Text("3"),
            ],
          ),
          const Row(
            children: [
              Text("KDV : "),
              Text("18"),
            ],
          ),
          const Row(
            children: [
              Text("StokNo : "),
              Text("100"),
            ],
          ),
          const Row(
            children: [
              Text("Fiyat : "),
              Text("150"),
            ],
          ),
          const Row(
            children: [
              Text("BIRIM : "),
              Text("ADET"),
            ],
          ),
          const Row(
            children: [
              Text("MalınCinsi : "),
              Text("STOK"),
            ],
          ),
          const Row(
            children: [
              Text("StokKodu : "),
              Text("STOK"),
            ],
          ),
          const Row(
            children: [
              Text("Isk1 : "),
              Text("2.5"),
            ],
          ),
          const Row(
            children: [
              Text("Isk2 : "),
              Text("2.5"),
            ],
          ),
          const Row(
            children: [
              Text("Isk3 : "),
              Text("2.5"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Text("Miktar :"),
              Text("5"),
            ],
          ),
          const Row(
            children: [
              Text("KDV : "),
              Text("18"),
            ],
          ),
          const Row(
            children: [
              Text("StokNo : "),
              Text("165"),
            ],
          ),
          const Row(
            children: [
              Text("Fiyat : "),
              Text("20"),
            ],
          ),
          const Row(
            children: [
              Text("BIRIM : "),
              Text("ADET"),
            ],
          ),
          const Row(
            children: [
              Text("MalınCinsi : "),
              Text("HİZMET"),
            ],
          ),
          const Row(
            children: [
              Text("StokKodu : "),
              Text("HİZMET"),
            ],
          ),
          const Row(
            children: [
              Text("Isk1 : "),
              Text("2.5"),
            ],
          ),
          const Row(
            children: [
              Text("Isk2 : "),
              Text("2.5"),
            ],
          ),
          const Row(
            children: [
              Text("Isk3 : "),
              Text("2.5"),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                CompanyApi.getCompanyInfo();
                _siparisVer();
              },
              child: const Text("Siparişi Ver")),
        ],
      ),
    );
  }

  void _siparisVer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String firmaKod = prefs.getString("firmaKod") ?? "";
    String firmaDonemKod = prefs.getString("firmaDonemKod") ?? "";
    InfoPostApi.getCustomerInfo(firmaKod, firmaDonemKod);
    await SiparisApi.postSiparis();
  }
}
