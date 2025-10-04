import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_db_model.dart';
import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_ui_model.dart';
import 'package:hive_flutter/adapters.dart';

class DbFunctions {
  final Box<TodoDbModel> _todoBox = Hive.box('todoBox');
   get getTodoDbBox => _todoBox;

  void addToTodoDb(TodoDbModel todo) {
    _todoBox.add(todo);
  }

  void removeFromTodoDb(int todoIndex) {
    _todoBox.deleteAt(todoIndex);
  }

  void markDbCompleted(TodoUiModel uiItem, bool todoCompleteStatus) {
    final copyOfItemId = _todoBox.values.toList().indexWhere(
      (item) => item.id == uiItem.id,
    );
    final getDbItem = _todoBox.getAt(copyOfItemId);
    final updatedTodo = TodoDbModel(
      id: getDbItem!.id,
      isCompleted: todoCompleteStatus,
      task: getDbItem.task,
    );

    _todoBox.putAt(copyOfItemId, updatedTodo);
  }
}
