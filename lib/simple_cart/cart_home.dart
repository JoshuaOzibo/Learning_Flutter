import 'package:flutter/material.dart';
import 'package:flutter_application_1/simple_cart/card.dart';
import 'package:flutter_application_1/simple_cart/product_details.dart';
import 'package:flutter_application_1/simple_cart/static_two.dart';

class CartHome extends StatelessWidget {
  const CartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...productList.map(
          (product) => ProductCard(
            handleTapAcartItem: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(productDetails: product),
              ),
            ),
            product: product,
          ),
        ),
      ],
    );
  }
}
