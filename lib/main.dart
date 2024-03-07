import 'package:auth_project/screen/compny_select_screen.dart';
import 'package:auth_project/screen/siprasi_screen.dart';
import 'package:auth_project/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';

import 'screen/home_page_screen.dart';
import 'screen/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/loginPage": (context) => LoginPage(),
        "/homePage": (context) => HomePage(),
        "/companyPage": (context) => CompanySelect(),
        "/productSearchPage": (context) => ProductListWidget(),
        "/siparisPage": (context) => SiparisPage(),
      },
      title: 'Flutter Auth',
      home: MainPage(),
      theme: ThemeData(canvasColor: Colors.white70),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
