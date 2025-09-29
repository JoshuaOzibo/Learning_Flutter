import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HivePage extends StatelessWidget {
  const HivePage({super.key});

  @override
  Widget build(BuildContext context) {
    createBox() async {
      // await Hive.openBox('myButtonBox');
    }

    createBox();

    void writeData() {
      final getBox = Hive.box('myButtonBox');
      getBox.put(2, 'Michael');
    }

    void readData() {
      final getBox = Hive.box('myButtonBox');
      print(getBox.get(2));
    }

    void deleteData() {
      final getBox = Hive.box('myButtonBox');
      getBox.clear();
    }

    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              child: Text('Write'),
              color: Colors.brown,
              minWidth: 10,
              onPressed: () => writeData(),
            ),
            MaterialButton(
              child: Text('Read'),
              minWidth: 10,
              color: Colors.blue,
              onPressed: () => readData(),
            ),
            MaterialButton(
              child: Text('Delete'),
              minWidth: 10,
              color: Colors.cyan,
              onPressed: () => deleteData(),
            ),
          ],
        ),
      ),
    );
  }
}
