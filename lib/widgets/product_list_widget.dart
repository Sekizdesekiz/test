import 'dart:convert';

import 'package:auth_project/data/info_post_api.dart';
import 'package:auth_project/data/product_get_api.dart';
import 'package:auth_project/models/customer_get.dart';
import 'package:auth_project/models/product.dart';
import 'package:auth_project/screen/login_screen.dart';
import 'package:auth_project/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductListWidget extends StatefulWidget {
  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  late List<Product> products = [];
  SharedPreferences? pref;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _getA();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Arama"),
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
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            searchButtonSection(),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(5),
                child: ListView.builder(
                  itemBuilder: buildProducts,
                  itemCount: products.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProducts(BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text(products[index].malincinsi),
        subtitle: Text(products[index].barcode),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          goProductDetail(this.products[index]);
        },
      ),
    );
  }

  searchButtonSection() {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                  label: Text(
                    "Ara",
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                searchArea(searchController.text);
              },
              child: const Icon(Icons.search))
        ],
      ),
    );
  }

  searchArea(String search) async {
    ProductGetApi.fetchPrudct(search).then((value) {
      setState(() {
        Iterable list = jsonDecode(value.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }

  void goProductDetail(Product product) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductDetailPage(product)));
  }

  void _getA() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String firmaKod = prefs.getString("firmaKod") ?? "";
    String firmaDonemKod = prefs.getString("firmaDonemKod") ?? "";
    InfoPostApi.getCustomerInfo(firmaKod, firmaDonemKod);
  }
}
