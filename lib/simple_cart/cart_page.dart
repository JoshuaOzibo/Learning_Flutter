import 'package:flutter/material.dart';
import 'package:flutter_application_1/simple_cart/card.dart';
import 'package:flutter_application_1/simple_cart/viewmodel/product_viewmodel.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class SimplrCartPage extends StatelessWidget {
  const SimplrCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final vm = context.watch<ProductViewmodel>();
    final loaclization = Hive.box('cartDetails');
    final vn = loaclization.get(1);
    return Column(
      children: [
        if (vn.getCart.isEmpty) Center(child: Text('cart is empty')),

        if (vn.getCart.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: vn.getCart.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: vn.getCart[index],
                  handleTapAcartItem: () => print('hello'),
                );
              },
            ),
          ),
      ],
    );
  }
}
