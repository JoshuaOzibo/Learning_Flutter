import 'package:flutter/material.dart';
import 'package:flutter_application_1/practicingMaping/task_one/note_app_db_model.dart';
import 'package:flutter_application_1/practicingMaping/task_one/note_app_ui_model.dart';
import 'package:hive_flutter/adapters.dart';

class NoteProvider extends ChangeNotifier {
  final List<NoteAppUiModel> notesList = [];
  final Box<NoteAppDbModel> _box = Hive.box('noteBox');

  void loadNotes() {
    for (var note in _box.values.toList()) {
      notesList.add(note.toUiModel());
      notifyListeners();
    }
    print(_box.values);
      // _box.clear();
  }

  void addNote(NoteAppUiModel note) {
    final convertToDb = NoteAppDbModel.todbModel(note);
    _box.add(convertToDb);
    notifyListeners();
     loadNotes();
  }

  void deleteNote(NoteAppUiModel note) {
    final index = _box.values.toList().indexWhere((item) => item.id == note.id);
    if(index != -1){
    _box.deleteAt(index);
    notifyListeners();
    }
     loadNotes();
  }
}
