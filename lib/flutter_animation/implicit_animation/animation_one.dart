import 'package:flutter/material.dart';

class AnimationOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRotation(
          turns: 10, 
        duration: const Duration(milliseconds: 1000),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(100)
            ),
            child: Center(child: Text('Home', style: TextStyle(color: Colors.white),)),
          ),
        ),
      )
    );
  }
}

/**
 * ScaleTransition(
        scale: ,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
          color: Colors.brown,
            borderRadius: BorderRadius.circular(100)
          ),
          child: Text('Hope'),
        ),
      ),
 */