import 'package:flutter/material.dart';

class AnimationThree extends StatelessWidget {
  const AnimationThree({super.key});

  final double size = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(
            begin: 0,
            end: 300
          ),
          duration: const Duration(milliseconds: 1500),
          builder: (context, size, widget) {
            
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: size,
                    spreadRadius: size / 2,
                  )
                ]
              ),

              child: Center(child: AnimatedOpacity(
                opacity: size > 200 ? 1 : 0,
                duration: const Duration(
                  milliseconds: 2500
                ),
                child: Text(size > 200 ? 'Hello' : ''))),
            );
          }
        ),
      ),
    );
  }
}