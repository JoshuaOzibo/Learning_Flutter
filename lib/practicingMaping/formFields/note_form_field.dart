import 'package:flutter/material.dart';

class NoteFormField extends StatelessWidget {
  const NoteFormField({
    super.key,
    required this.titleEditingController,
    required this.contentEditingController,
    required this.handleSubmitForm,
  });

  final TextEditingController titleEditingController;
  final TextEditingController contentEditingController;
  final VoidCallback handleSubmitForm;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 12),

          TextField(
            controller: titleEditingController,
            decoration: InputDecoration(hint: Text('enter title')),
          ),
          SizedBox(height: 12),
          TextField(
            controller: contentEditingController,
            decoration: InputDecoration(hint: Text('enter content')),
          ),

          SizedBox(height: 12),

          MaterialButton(
            height: 50,
            color: Colors.blue,
            minWidth: double.infinity,
            onPressed: handleSubmitForm,
            child: Text('Add a note'),
          ),
        ],
      ),
    );
  }
}
