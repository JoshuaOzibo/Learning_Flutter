import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_db_model.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_ui_model.dart';
import 'package:hive_flutter/adapters.dart';

class TodoProvider {
  final List<TodoUiModel> todoList = [];
  final Box<TodoDbModel> todoBox = Hive.box('todoBox');
}
