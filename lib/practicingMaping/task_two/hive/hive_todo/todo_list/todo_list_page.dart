import 'package:flutter/material.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/provider/todo_provider.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_list/todo_card.dart';
import 'package:provider/provider.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vn = context.watch<TodoProvider>();
    return Expanded(
      child: ListView(
        children: [
          if (vn.todoList.isEmpty) Text('todo items list is empty'),
          ...vn.todoList.map((item) => TodoCard()),
        ],
      ),
    );
  }
}
