import 'package:flutter/material.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/provider/todo_provider.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_form_page/todo_form_page.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_list/todo_list_page.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_ui_model.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      
    });
  }


  final uuid = Uuid();

  handleSubmit(todo) {
    final todoItems = TodoUiModel(
      id: uuid.v4(),
      task: todo,
      isCompleted: false,
    );

    context.read<TodoProvider>().addToTodo(todoItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TodoFormPage(handleSubmit: (item) => handleSubmit),
          TodoListPage(),
        ],
      ),
    );
  }
}
