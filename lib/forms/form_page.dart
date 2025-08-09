import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      title: const Text("My App Title"),
      // backgroundColor: Colors.blue,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu, size: 30),
        onPressed: () {
          // Action for menu button
          debugPrint("Menu button pressed");
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, size: 30),
          onPressed: () {
            // Action for search button
            debugPrint(  "Search button pressed");
          },
        )
      ],
    );
  }
}

/**
 * Container(
      width: 800,
      height: 200,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          'Form Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )
      )
    );
 */