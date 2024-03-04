import 'package:auth_project/models/product.dart';
import 'package:auth_project/widgets/product_details_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  Product product;

  ProductDetailPage(this.product);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState(product);
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Product product;

  _ProductDetailPageState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Detayları"),
      ),
      body: ProductDetailWidget(product),
    );
  }
}
