import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: Text("CompanyApp")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("AnaSayfa"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, "/homePage");
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Ayarlar"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, "/companyPage");
            },
          )
        ],
      ),
    );
  }
}
