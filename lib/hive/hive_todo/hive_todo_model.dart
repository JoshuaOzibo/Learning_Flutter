import 'package:hive/hive.dart';

part 'hive_todo_model.g.dart';

@HiveType(typeId: 3)
class HiveTodoModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  HiveTodoModel({required this.name, required this.age});
}
