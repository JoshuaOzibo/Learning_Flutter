import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key, required this.textController, required this.handleAdd});

  final TextEditingController textController;
  final VoidCallback handleAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        TextField(
          controller: textController,
        ),
        MaterialButton(
          onPressed: handleAdd,
          child: Text('Add'),
          )
      ],
    );
  }
}