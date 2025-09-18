import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.text,
    required this.tapDeleteButton,
    required this.tapFavriteButton,
  });

  final String text;
  final ValueChanged<String> tapDeleteButton;
  final ValueChanged<String> tapFavriteButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.brown,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontSize: 15, color: Colors.white)),
            GestureDetector(
              onTap: () => tapFavriteButton(text),
              child: Icon(Icons.heart_broken, color: Colors.white,),
            ),
          GestureDetector(
            onTap: () => tapDeleteButton(text),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
