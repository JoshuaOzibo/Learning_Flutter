import 'package:flutter/material.dart';

class AnimationThree extends StatelessWidget {
  const AnimationThree({super.key});

  final double size = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 2000),
        tween: Tween<double>(begin: 0, end: 200),
        builder: (context, size, widget) {
          return Center(
            child: Column(
              children: [
                Container(
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
                      ),
                    ],
                  ),
                ),
          
                Spacer(),
          
                AnimatedAlign(
                  alignment: Alignment(-0.6, 0), 
                  duration: const Duration(milliseconds: 3000),
                  child:  Text('Hello world'),
                  ),
          
                Spacer(),
          
                Container(
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}


/**
 * child: Center(
          child: AnimatedOpacity(
            opacity: size > 200 ? 1 : 0,
            duration: const Duration(milliseconds: 1500),
            child: Text(size > 200 ? 'Hello' : ''),
          ),
        ),
 */