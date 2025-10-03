import 'package:flutter_application_1/practicingMaping/task_one/note_app_ui_model.dart';
import 'package:hive_flutter/adapters.dart';

part 'note_app_db_model.g.dart';

@HiveType(typeId: 5)
class NoteAppDbModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String content;
  @HiveField(3)
  String createdAt;

  NoteAppDbModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  // convert ui model to db model
  factory NoteAppDbModel.todbModel(NoteAppUiModel noteUiModel) {
    return NoteAppDbModel(
      id: noteUiModel.id,
      title: noteUiModel.title,
      content: noteUiModel.content,
      createdAt: noteUiModel.createdAt,
    );
  }

  // convert from db model to ui model
  NoteAppUiModel toUiModel() {
    return NoteAppUiModel(
      id: id,
      title: title,
      content: content,
      createdAt: createdAt,
    );
  }
}
