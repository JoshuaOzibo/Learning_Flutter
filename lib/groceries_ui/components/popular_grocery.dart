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
      // margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          // Image
          Image.asset(
            'images/tomato.png',
            height: 100,
            width: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text
              Text(
                'Tomatoes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // rating icon
              Icon(Icons.star, color: Colors.black),
              // RatingBarIndicator(
              Text(
                '4.2',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          )
        ],
      )
    );
  }
}