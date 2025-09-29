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
  fetchFunc() async {
    await ProductViewmodel().fetch();
  }

  @override
  void initState() {
    super.initState();
    context.read<ProductViewmodel>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProductViewmodel>();
    print(vm.getProduct);
    return ListView.builder(
      itemCount: vm.getProduct.length,
      itemBuilder: (context, index) {
        final item = vm.getProduct[index];
        return ProductCard(
          product: item,
          handleTapAcartItem: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetails(productDetails: item),
            ),
          ),
        );
      },
    );
  }
}
