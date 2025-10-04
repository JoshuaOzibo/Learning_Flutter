import 'package:flutter/material.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_list/todo_card.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView(
      children: [
        TodoCard()
      ],
    ));
  }
}