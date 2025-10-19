import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatelessWidget {
  const BouncingBallAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomPaint(
              size: Size(200, 200),
              painter: BouncingBallPainter(),
            )
          ])),
    );
  }
}

class BouncingBallPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
    Offset(size.width / 2, 0), 
    20, 
    Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}
