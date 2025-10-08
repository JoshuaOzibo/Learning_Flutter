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

        SizedBox(height: 10,),

        MaterialButton(
          color: Colors.brown,
          shape: BeveledRectangleBorder(borderRadius: BorderRadiusGeometry.circular(2)),
          onPressed: () {
            handleSubmit(todoEditingController.text);
          },
          child: Text('add todo', style: TextStyle(
            color: Colors.white, 
          ),),
        ),
      ],
    );
  }
}
