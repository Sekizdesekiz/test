import 'dart:convert';

import 'package:auth_project/data/company_api.dart';
import 'package:auth_project/models/company.dart';
import 'package:flutter/material.dart';

List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class CompanySelect extends StatefulWidget {
  @override
  State<CompanySelect> createState() => _CompanySelectState();
}

class _CompanySelectState extends State<CompanySelect> {
  late List<Company> companys;
  String? dropdownValue;
  bool _isLoading = false;

  @override
  void initState() {
    getCompanyInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              },
              items: companys.map<DropdownMenuItem<String>>((Company value) {
                return DropdownMenuItem<String>(
                  value: value.firmaadi,
                  child: Text(value.firmaadi!),
                );
              }).toList(),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Firmayı seç."))
          ],
        ),
      ),
    );
  }

  Future<void> getCompanyInfo() async {
    await CompanyApi.getCompanyInfo().then((value) {
      setState(() {
        Iterable list = jsonDecode(value.body);
        this.companys =
            list.map((conpany) => Company.fromJson(conpany)).toList();
        dropdownValue = this.companys.first.firmaadi;
      });
    });
  }
}
