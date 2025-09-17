import 'package:flutter/material.dart';
import 'package:flutter_application_1/simple_todo_app/todo_card.dart';
import 'package:flutter_application_1/simple_todo_app/todo_form.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final todoItem = ['Joshua', 'Michael'];
  final TextEditingController textEditingController = TextEditingController();
  final String todoText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        spacing: 10,
        children: [
          TodoForm(
            todoText: todoText
            ),
          ...todoItem.map((item) => TodoCard(text: item)),
        ],
      ),
    );
  }
}
