import 'package:flutter/material.dart';

enum BubblePointerLocation { top, bottom }

class BubbleContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final BubblePointerLocation pointerLocation;
  final double pointerOffset;

  const BubbleContainer({
    super.key,
    required this.child,
    this.color = const Color.fromARGB(255, 184, 93, 93),
    this.pointerLocation = BubblePointerLocation.bottom,
    this.pointerOffset = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    const pointerSize = 14.0;

    // Adjust padding based on pointer location
    final padding = pointerLocation == BubblePointerLocation.bottom
        ? const EdgeInsets.fromLTRB(20, 20, 20, 20 + pointerSize)
        : const EdgeInsets.fromLTRB(20, 20 + pointerSize, 20, 20);

    return CustomPaint(
      painter: BubblePainter(
        color: color,
        pointerLocation: pointerLocation,
        pointerOffset: pointerOffset,
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}

class BubblePainter extends CustomPainter {
  final Color color;
  final BubblePointerLocation pointerLocation;
  final double pointerOffset;

  BubblePainter({
    required this.color,
    required this.pointerLocation,
    required this.pointerOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    const radius = 20.0;
    const pointerHeight = 14.0;
    const pointerWidth = 30.0;

    // Define top and bottom bounds for the bubbly part
    final top = pointerLocation == BubblePointerLocation.top
        ? pointerHeight
        : 0.0;
    final bottom = pointerLocation == BubblePointerLocation.bottom
        ? size.height - pointerHeight
        : size.height;

    // 1. Top Edge
    if (pointerLocation == BubblePointerLocation.top) {
      // Start at Top-Left after radius
      path.moveTo(radius, top);

      // Calculate top pointer position
      // Using same logic: offset from right corner end
      final pointerBaseRightX = size.width - radius - pointerOffset;
      final pointerTipX = pointerBaseRightX - (pointerWidth / 2);
      final pointerBaseLeftX = pointerBaseRightX - pointerWidth;

      path.lineTo(pointerBaseLeftX, top);
      path.lineTo(pointerTipX, 0); // Tip at absolute top 0
      path.lineTo(pointerBaseRightX, top);

      path.lineTo(size.width - radius, top);
    } else {
      path.moveTo(radius, top);
      path.lineTo(size.width - radius, top);
    }

    // Top-Right Corner
    path.quadraticBezierTo(size.width, top, size.width, top + radius);

    // 2. Right Edge
    path.lineTo(size.width, bottom - radius);

    // Bottom-Right Corner
    path.quadraticBezierTo(size.width, bottom, size.width - radius, bottom);

    // 3. Bottom Edge
    if (pointerLocation == BubblePointerLocation.bottom) {
      // Pointer (Bottom Right)
      final pointerBaseRightX = size.width - radius - pointerOffset;
      final pointerTipX = pointerBaseRightX - (pointerWidth / 2);
      final pointerBaseLeftX = pointerBaseRightX - pointerWidth;

      path.lineTo(pointerBaseRightX, bottom);
      path.lineTo(pointerTipX, size.height); // Tip at absolute bottom
      path.lineTo(pointerBaseLeftX, bottom);

      path.lineTo(radius, bottom);
    } else {
      path.lineTo(radius, bottom);
    }

    // Bottom-Left Corner
    path.quadraticBezierTo(0, bottom, 0, bottom - radius);

    // 4. Left Edge
    path.lineTo(0, top + radius);

    // Top-Left Corner
    path.quadraticBezierTo(0, top, radius, top);

    path.close();

    // Shadow
    canvas.drawShadow(path, Colors.black.withOpacity(0.15), 8, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true; // Repaint if props change
}
