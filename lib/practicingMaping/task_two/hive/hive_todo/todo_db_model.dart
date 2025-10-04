import 'package:flutter_application_1/practicingMaping/task_two/hive/hive_todo/todo_ui_model.dart';
import 'package:hive/hive.dart';

part 'todo_db_model.g.dart';

@HiveType(typeId: 6)
class TodoDbModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String task;
  @HiveField(2)
  bool isCompleted = false;

  TodoDbModel({
    required this.id,
    required this.task,
    required this.isCompleted,
  });

  // from ui to db model
  factory TodoDbModel.todbModel(TodoUiModel todoUiModel) {
    return TodoDbModel(
      id: todoUiModel.id,
      task: todoUiModel.task,
      isCompleted: todoUiModel.isCompleted,
    );
  }

  // from db to ui model
  TodoUiModel toUiModel() {
    return TodoUiModel(id: id, task: task, isCompleted: isCompleted);
  }
}
