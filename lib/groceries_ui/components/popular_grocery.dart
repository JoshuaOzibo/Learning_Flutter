import 'package:flutter/material.dart';

class PopularGrocery extends StatelessWidget {
  const PopularGrocery({
    super.key,
    required this.image,
    required this.groceryName,
    required this.price,
    required this.rating,
  });

  final String image;
  final String groceryName;
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),

      padding: const EdgeInsets.all(5.0),
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🔹 Image container with full width + gray background
          Container(
            width: double.infinity,
            color: Colors.grey[200], // light gray background
            padding: const EdgeInsets.all(
              10,
            ), // optional, gives spacing around image
            child: Image.asset(
              image,
              height: 80,
              fit: BoxFit.contain, // keep image inside
            ),
          ),

          const SizedBox(height: 10), // spacing between image and text
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      groceryName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.black),
                        Text(
                          rating,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10), // spacing between text and price
                // price and icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      radius: 15,
                      // controls size
                      backgroundColor: Colors.green,
                      child: Icon(Icons.add, color: Colors.white, size: 20),
                    ), // add icon
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
