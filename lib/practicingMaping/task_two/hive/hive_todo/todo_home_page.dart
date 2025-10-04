import 'package:flutter/material.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_form_page/todo_form_page.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  handleSubmit(todo) {
    print(todo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TodoFormPage(handleSubmit: (item) => handleSubmit)
          ],
      ),
    );
  }
}
