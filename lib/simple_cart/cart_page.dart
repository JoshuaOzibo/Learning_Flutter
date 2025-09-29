import 'package:flutter/material.dart';
import 'package:flutter_application_1/simple_cart/card.dart';
import 'package:flutter_application_1/simple_cart/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

class SimplrCartPage extends StatelessWidget {
  const SimplrCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProductViewmodel>();
    print(vm.getCart.length);
    return Column(
      children: [
        if (vm.getProduct.isEmpty) Center(child: Text('cart is empty')),

        if(vm.getProduct.isNotEmpty)
        Expanded(
          child: ListView.builder(
            itemCount: vm.getCart.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: vm.getProduct[index],
                handleTapAcartItem: () => print('hello'),
              );
            },
          ),
        ),
      ],
    );
  }
}
