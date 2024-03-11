import 'dart:convert';

import 'package:auth_project/constants/company_provider.dart';
import 'package:auth_project/data/company_api.dart';
import 'package:auth_project/data/donem_api.dart';
import 'package:auth_project/data/info_post_api.dart';
import 'package:auth_project/models/company.dart';
import 'package:auth_project/models/donem.dart';
import 'package:auth_project/screen/login_screen.dart';
import 'package:auth_project/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanySelect extends StatefulWidget {
  @override
  State<CompanySelect> createState() => _CompanySelectState();
}

class _CompanySelectState extends State<CompanySelect> {
  SharedPreferences? pref;
  late List<Company> companys = [];
  late List<Donem> donems = [];
  String? dropdownValue;
  String? dropdownValue2;
  String? firmaAdi;
  late String firmaKod;
  String? firmaDonem;
  late String firmaDonemKod;

  @override
  void initState() {
    getCompanyInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
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
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
                String? selectedFirmaKodu = companys
                    .firstWhere((element) => element.firmaadi == value,
                        orElse: () => Company(firmaadi: '', firmakodu: ''))
                    .firmakodu;
                if (selectedFirmaKodu != null && selectedFirmaKodu.isNotEmpty) {
                  getCompanyDonem(selectedFirmaKodu);
                  firmaKod = selectedFirmaKodu;
                }
              },
              items: companys.map<DropdownMenuItem<String>>((Company value) {
                return DropdownMenuItem<String>(
                  value: value.firmaadi,
                  child: Text(value.firmaadi!),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: dropdownValue2,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue2 = value!;
                });
                String? selectedDonemKodu = donems
                    .firstWhere(
                        (element) => element.donemadi.toString() == value,
                        orElse: () => Donem(donemadi: 0, donemkod: ''))
                    .donemkod;
                if (selectedDonemKodu != null && selectedDonemKodu.isNotEmpty) {
                  firmaDonemKod = selectedDonemKodu;
                }
              },
              items: donems.map<DropdownMenuItem<String>>((Donem value) {
                return DropdownMenuItem<String>(
                  value: value.donemadi.toString(),
                  child: Text(value.donemadi.toString()),
                );
              }).toList(),
            ),
            ElevatedButton(
                onPressed: () async {
                  context.read<CompanyProvider>().changeCompanyName(
                      newCompanyNamePro: dropdownValue ?? "");
                  context.read<CompanyProvider>().changeCompanyDonem(
                      newCompanyDonemPro: dropdownValue2 ?? "");
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("firmaAdi", dropdownValue ?? "");
                  prefs.setString("firmaDonem", dropdownValue2 ?? "");
                  _saveCompanyInfo(firmaKod, firmaDonemKod);
                },
                child: Text("Kaydet"))
          ],
        ),
      ),
    );
  }

  void getCompanyInfo() async {
    await CompanyApi.getCompanyInfo().then((value) {
      setState(() {
        Iterable list = jsonDecode(value.body);
        this.companys =
            list.map((conpany) => Company.fromJson(conpany)).toList();
        dropdownValue = this.companys.first.firmaadi;
      });
    });
  }

  void getCompanyDonem(String firmaKodu) async {
    await DonemApi.getDonemInfo(firmaKodu).then((value) {
      setState(() {
        Iterable list = jsonDecode(value.body);
        this.donems = list.map((e) => Donem.fromJson(e)).toList();
      });
    });
  }

  void _saveCompanyInfo(String firmaKod, String firmaDonemKod) async {
    InfoPostApi.getCustomerInfo(firmaKod, firmaDonemKod);
    Navigator.pop(context);
  }
}
