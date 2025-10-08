import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.title, required this.isCompleted});

  final bool isCompleted;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(title),
          Row(
            children: [
              MaterialButton(
                child: Text('completed($isCompleted)'),
                onPressed: () => print('object'),
              ),
              MaterialButton(
                child: Text('pending(${!isCompleted})'),
                onPressed: () => print('object'),
              ),
              GestureDetector(
                onTap: () => print('hello'),
                child: Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
