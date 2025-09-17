import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({super.key, required this.todoText, required this.onSubmit});
  final String todoText;
  final ValueChanged<String> onSubmit;

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = widget.todoText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        spacing: 30,
        children: [
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: 'Enter Todo',
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.brown),
              ),
            ),
          ),

          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(onPressed: () => setState(() {
                final newTodo = textEditingController.text;
                widget.onSubmit(newTodo);
            }), child: Text('Add Todo')),
          ),
        ],
      ),
    );
  }
}
