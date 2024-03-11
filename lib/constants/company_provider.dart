import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyProvider extends ChangeNotifier {
  String? companyNamePro;
  String? companyDonemPro;

  CompanyProvider() {
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    companyNamePro = prefs.getString("firmaAdi");
    companyDonemPro = prefs.getString("firmaDonem");
    notifyListeners();
  }

  void changeCompanyName({
    required String newCompanyNamePro,
  }) async {
    companyNamePro = newCompanyNamePro;
    notifyListeners();
  }

  void changeCompanyDonem({
    required String newCompanyDonemPro,
  }) async {
    companyDonemPro = newCompanyDonemPro;
    notifyListeners();
  }
}
