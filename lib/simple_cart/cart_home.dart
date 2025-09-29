import 'package:flutter/material.dart';
import 'package:flutter_application_1/simple_cart/card.dart';
import 'package:flutter_application_1/simple_cart/product_details.dart';
import 'package:flutter_application_1/simple_cart/static_two.dart';
import 'package:flutter_application_1/simple_cart/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

class CartHome extends StatefulWidget {
  const CartHome({super.key});

  @override
  State<CartHome> createState() => _CartHomeState();
}

class _CartHomeState extends State<CartHome> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
    final vm = Provider.of<ProductViewmodel>(context, listen: false);
    final value =vm.fetchProduct();
  });
  }

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
