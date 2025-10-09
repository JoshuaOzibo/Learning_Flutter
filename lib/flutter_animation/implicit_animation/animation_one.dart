import 'dart:math';

import 'package:flutter/material.dart';

class AnimationOne extends StatefulWidget {
  const AnimationOne({super.key});

  @override
  State<AnimationOne> createState() => _AnimationOneState();
}

class _AnimationOneState extends State<AnimationOne> {
  List<Color> currentPalette = generateRandomColor();

  static List<Color> generateRandomColor() {
    final random = Random();

    return List.generate(
      5,
      (_) => Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      ),
    );
  }

  void regenerate() {
    setState(() {
      currentPalette = generateRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            for (var color in currentPalette)
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 500,
                ),
                // curve: ,
                width: 100,
                height: 100,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),

            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 20),
              onPressed: regenerate,
              child: Text('Generate color'),
            ),
          ],
        ),
      ),
    );
  }
}
