import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text('First task'),
          Row(
            children: [
              MaterialButton(
                child: Text('completed'),
                onPressed: () => print('object'),
              ),
              MaterialButton(
                child: Text('pending'),
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
