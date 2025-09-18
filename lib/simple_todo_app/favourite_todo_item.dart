import 'package:flutter/material.dart';

class FavouriteTodoItem extends StatelessWidget {
  const FavouriteTodoItem({super.key, required this.favrite});
  final String favrite;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.brown,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                favrite,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              GestureDetector(
                // onTap: () => tapDeleteButton(text),
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
