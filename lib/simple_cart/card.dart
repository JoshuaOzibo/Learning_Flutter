import 'package:flutter/material.dart';
import 'package:flutter_application_1/simple_cart/models/static.dart';


class ProductCard extends StatelessWidget {
  final Product product;
  final GestureTapCallback handleTapAcartItem;
 
  const ProductCard({super.key, required this.product, required this.handleTapAcartItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTapAcartItem,
      child: SizedBox(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                // Product Image
                Image.asset(
                  product.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                
                // Product Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title, 
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(product.subTitle, style: const TextStyle(color: Colors.grey)),
                      Text("\$${product.price}", style: const TextStyle(fontSize: 16, color: Colors.green)),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          Text(product.rating.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Quantity
                Text("x${product.quantity}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
