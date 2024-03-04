import 'dart:convert';

import 'package:auth_project/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailWidget extends StatelessWidget {
  Product product;

  ProductDetailWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: product.resim != null
                    ? Image.memory(base64Decode(product.resim))
                    : Image.network(
                        "https://vipha.co/wp-content/themes/vipha/images/empty-img.png",
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ListView(
                        children: [
                          Card(
                            child: ListTile(
                              title: Text(product.ind.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text("Kur Alış"),
                              trailing: Text(
                                product.kuralis.toString(),
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.kursatis.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title:
                                  Text(product.kdvdahilsatisfiyatI1.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title:
                                  Text(product.kdvharicsatisfiyatI1.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title:
                                  Text(product.kdvdahilalisfiyati.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.kdvdahilmaliyet.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.stokkudu.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.barcode.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.pB1.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.dovizcinsi.toString()),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ListView(
                        children: [
                          Card(
                            child: ListTile(
                              title: Text(product.koD9.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.karoranI1.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.stoktipi.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.giren.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.cikan.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.envanter.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title:
                                  Text(product.kdvharicalisfiyati.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.satisfiyatI1.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.aliskdvorani.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.kdv.toString()),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(product.kdvharicmaliyet.toString()),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
