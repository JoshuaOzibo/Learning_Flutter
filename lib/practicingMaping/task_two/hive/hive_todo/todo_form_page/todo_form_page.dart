import 'package:flutter/material.dart';

class TodoFormPage extends StatelessWidget {
  const TodoFormPage({super.key, required this.handleSubmit});

  final ValueChanged handleSubmit;

  @override
  Widget build(BuildContext context) {
    final TextEditingController todoEditingController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: todoEditingController,
          decoration: InputDecoration(
            hint: Text('enter task'),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
            ),
          ),
        ),

        MaterialButton(
          onPressed: () {
            handleSubmit(todoEditingController);
          },
        ),
      ],
    );
  }
}
