import 'package:flutter/material.dart';
import 'dart:math';

class AnimationTwo extends StatefulWidget {
  const AnimationTwo({super.key});

  @override
  State<AnimationTwo> createState() => _AnimationTwoState();
}

class _AnimationTwoState extends State<AnimationTwo> {
 bool _showFirst = true;

  void _toggle() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: GestureDetector(
          onTap: _toggle,
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 800),
            firstChild: Container(
              width: 200,
              height: 200,
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Text(
                "Tap Me!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            secondChild: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/meat.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            crossFadeState: _showFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }
}

/**
 import 'package:flutter/material.dart';

class CrossFadeDemo extends StatefulWidget {
  const CrossFadeDemo({super.key});

  @override
  State<CrossFadeDemo> createState() => _CrossFadeDemoState();
}

class _CrossFadeDemoState extends State<CrossFadeDemo> {
  bool _showFirst = true;

  void _toggle() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: GestureDetector(
          onTap: _toggle,
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 800),
            firstChild: Container(
              width: 200,
              height: 200,
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Text(
                "Tap Me!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            secondChild: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage("https://picsum.photos/200"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            crossFadeState: _showFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }
}


 */
