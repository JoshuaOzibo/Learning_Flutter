import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveTodoPage extends StatefulWidget {
  const HiveTodoPage({super.key});

  @override
  State<HiveTodoPage> createState() => _HiveTodoPageState();
}

class _HiveTodoPageState extends State<HiveTodoPage> {
  final TextEditingController _editNameTextController = TextEditingController();
  final TextEditingController _editAgeTextController = TextEditingController();
  // final hiveBox = Hive.

  // getHiveStorage<Void>(todoData) {
  //   setState(() {
  //     hiveBox.put(1, todoData);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final boxValue = hiveBox.get(1);
    // print(boxValue);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          children: [
            TextField(
              controller: _editNameTextController,
              decoration: InputDecoration(hint: Text('Name')),
            ),
            TextField(
              controller: _editAgeTextController,
              decoration: InputDecoration(hint: Text('Age')),
            ),

            MaterialButton(
              onPressed: () => print('object'),
              // onPressed: () => getHiveStorage(_editNameTextController.text),
              child: Text('add item'),
            ),
          ],
        ),
      ),
    );
  }
}
