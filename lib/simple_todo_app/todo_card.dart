import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.text, required this.tapDeleteButton});

  final String text;
  final ValueChanged<String> tapDeleteButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.brown,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text), 
          GestureDetector(
            onTap: () => tapDeleteButton(text),
            child: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
