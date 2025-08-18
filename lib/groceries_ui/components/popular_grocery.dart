import 'package:flutter/material.dart';

class PopularGrocery extends StatelessWidget {
  const PopularGrocery({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // ✅ prevents unnecessary expansion
        children: [
          // 🔹 Image container
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'images/tomato.png',
              height: 100,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 10),

          // 🔹 Name + rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tomato',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.black, size: 16),
                  SizedBox(width: 4),
                  Text(
                    '4.2',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10), // smaller spacing to avoid overflow
          // 🔹 Price + add icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₦20,000',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.green,
                child: Icon(Icons.add, color: Colors.white, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
