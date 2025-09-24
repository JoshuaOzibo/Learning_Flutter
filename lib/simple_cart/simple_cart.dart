import 'package:flutter/material.dart';
import 'package:flutter_application_1/simple_cart/card.dart';
import 'package:flutter_application_1/simple_cart/product_details.dart';
import 'package:flutter_application_1/simple_cart/static_two.dart';

class SimpleCart extends StatelessWidget {
  const SimpleCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body:  ListView(
      children: [
        ...productList.map(( product) => ProductCard(
          handleTapAcartItem: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(productDetails: product))),
          product: product)
          )
      ],
    ),
    );
  }
}