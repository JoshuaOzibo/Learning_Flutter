import 'package:flutter/material.dart';

class RotationAnimation extends StatefulWidget {
  const RotationAnimation({super.key});

  @override
  State<RotationAnimation> createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation> {

  double rotateTurns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            setState(() {
              rotateTurns += 4;
            });
          },
          child: AnimatedRotation(
            turns: rotateTurns,
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: 120,
              height: 120,
              color: Colors.deepOrange,
              child: const Icon(Icons.refresh, size: 60, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
