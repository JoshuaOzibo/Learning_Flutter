import 'package:flutter/material.dart';
import 'package:flutter_application_1/practicingMaping/formFields/note_form_field.dart';
import 'package:flutter_application_1/practicingMaping/noteHomePage/dummy_note.dart';
import 'package:flutter_application_1/practicingMaping/noteHomePage/note_provider.dart';
import 'package:flutter_application_1/practicingMaping/task_one/note_app_ui_model.dart';
import 'package:provider/provider.dart';

class NoteHomePage extends StatefulWidget {
  const NoteHomePage({super.key});

  @override
  State<NoteHomePage> createState() => _NoteHomePageState();
}

class _NoteHomePageState extends State<NoteHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<NoteProvider>().loadNotes();
    });
  }

  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController contentEditingController =
      TextEditingController();

  final note = DummyNote().uiNote;
  @override
  Widget build(BuildContext context) {
    final vn = context.watch<NoteProvider>();
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: NoteFormField(
                titleEditingController: titleEditingController,
                contentEditingController: contentEditingController,
                handleSubmitForm: () => {
                  vn.addNote(
                  NoteAppUiModel(
                    id: vn.notesList.length + 1,
                    title: titleEditingController.text,
                    content: contentEditingController.text,
                    createdAt: '05-04-09',
                  ),
                ),
                // titleEditingController.clear(),
                // contentEditingController.clear(),
                }
              ),
            ),

            SizedBox(height: 50,),

            if(vn.notesList.isEmpty)
            Text('Note List is empty'),

            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: vn.notesList.length,
                itemBuilder: (context, index) {
                  final item = vn.notesList[index];
                  return Container(
                    margin: EdgeInsets.only(top: 5),
                    child: ListTile(
                      onLongPress: ()=> vn.deleteNote(item),
                      tileColor: Colors.brown,
                      titleTextStyle: TextStyle(color: Colors.white),
                      title: Text(item.title),
                      subtitle: Text(item.content),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
