import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_db_model.dart';
import 'package:hive_flutter/adapters.dart';

class DbFunctions {
  final Box<TodoDbModel> _todoBox = Hive.box('todoBox');

  void addToTodoDb(TodoDbModel todo) {
    _todoBox.add(todo);
  }

  void removeFromTodoDb(int todoIndex) {
    _todoBox.deleteAt(todoIndex);
  }
}
