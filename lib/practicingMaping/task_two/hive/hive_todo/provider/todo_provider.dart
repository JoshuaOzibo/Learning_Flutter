import 'package:flutter/material.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/provider/db_functions/db_functions.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_db_model.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_ui_model.dart';
import 'package:hive/hive.dart';

class TodoProvider extends ChangeNotifier {
  final dbFunc = DbFunctions();
  final List<TodoUiModel> todoList = [];

  void loadTodoToList(){
    final getdb = Hive.box('todoBox');
    for(var dbItems in getdb.values.toList()){
      todoList.add(dbItems.toUiModel());
    }
  }

  void addToTodo(TodoUiModel todoItem) {
    final todoUiToDb = TodoDbModel.todbModel(todoItem);
    todoList.add(todoItem);
    // add to db
    dbFunc.addToTodoDb(todoUiToDb);
    notifyListeners();
  }

  void removeTodo(TodoUiModel todoItem) {
    final getItemIndex = todoList.indexWhere((item) => item.id == todoItem.id);
    todoList.remove(todoItem);
    // remove from db
    dbFunc.removeFromTodoDb(getItemIndex);
    notifyListeners();
  }

  void markCompleted(TodoUiModel todoItem) {
    final todoCompleteStatus = todoItem.isCompleted;
    // update from db
    dbFunc.markDbCompleted(todoItem, todoCompleteStatus);
    notifyListeners();
  }
}
