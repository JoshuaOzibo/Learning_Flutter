import 'package:flutter/material.dart';

class PopularGrocery extends StatelessWidget {
  const PopularGrocery({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Colors.white,
  ),
  padding: const EdgeInsets.all(10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // 🔹 Image container with full width + gray background
      Container(
        width: double.infinity,
        color: Colors.grey[300], // light gray background
        padding: const EdgeInsets.all(10), // optional, gives spacing around image
        child: Image.asset(
          'images/tomato.png',
          height: 100,
          fit: BoxFit.contain, // keep image inside
        ),
      ),

      const SizedBox(height: 10), // spacing between image and text

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Tomato',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.black),
              Text(
                '4.2',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);

  }
}
