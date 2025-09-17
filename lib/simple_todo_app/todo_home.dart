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
  final String todoText = '';
  void onPressAdd(String newTodo){
      print(todoText);
      print(newTodo);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        spacing: 10,
        children: [
          TodoForm(
            onSubmit: onPressAdd,
            todoText: todoText
            ),
          ...todoItem.map((item) => TodoCard(text: item)),
        ],
      ),
    );
  }
}
