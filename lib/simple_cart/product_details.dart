import 'package:flutter/material.dart';
import 'package:flutter_application_1/simple_cart/models/static.dart';
import 'package:flutter_application_1/simple_cart/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productDetails});
  final Product productDetails;

  @override
  Widget build(BuildContext context) {
    final vm = context.read<ProductViewmodel>();
    return Scaffold(
      appBar: AppBar(title: Text('${productDetails.title} details')),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          spacing: 20,
          children: [
            Image.asset(productDetails.image),
            Text(productDetails.title),
            Text(productDetails.subTitle),
            Text(productDetails.price.toString()),
            Text(productDetails.rating.toString()),
            Text(productDetails.quantity.toString()),

            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(),
                onPressed: () => vm.addToCart(productDetails),
                child: Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
