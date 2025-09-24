import 'package:flutter/material.dart';
import 'package:flutter_application_1/simple_cart/static.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productDetails});
  final Product productDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${productDetails.title} details'),),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          spacing: 20,
          children: [
            Image.asset(
              productDetails.image
            ),
            Text(productDetails.title),
            Text(productDetails.subTitle),
            Text(productDetails.price.toString()),
            Text(productDetails.rating.toString()),
            Text(productDetails.quantity.toString()),
          ],
        ),
      ),
    );
  }
}