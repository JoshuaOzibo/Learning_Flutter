import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with TickerProviderStateMixin {
  final double progress = 1;
  late AnimationController controller;
  late AnimationController scaleController;
  late Animation<double> progressAnimation;
  late Animation<double> scaleTransit;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // animation
    progressAnimation = Tween<double>(
      begin: 0.0,
      end: progress,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    scaleTransit = Tween<double>(
      begin: 0,
      end: 5,
    ).animate(CurvedAnimation(parent: scaleController, curve: Curves.easeOut));

    controller.addListener(() {
      if (controller.isCompleted) {
        scaleController.forward();
      }
    });

    scaleController.addListener(() {
      if (scaleController.isCompleted) {
        Navigator.of(
          context,
        ).push(MyCustomRouteTransiction(route: const Destination()));
        Timer(const Duration(milliseconds: 500), () {
          scaleController.reset();
          controller.reset();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    scaleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: progressAnimation,
          builder: (context, widget) {
            return controller.isCompleted
                ? ScaleTransition(
                    scale: scaleTransit,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: CircularProgressIndicator(
                          value: progressAnimation.value,
                          strokeWidth: 10,
                          color: Colors.amber,
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ),

                      Text('${(progressAnimation.value * 100).toInt()}%'),
                    ],
                  );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        child: Text('Click'),
      ),
    );
  }
}

class Destination extends StatefulWidget {
  const Destination({super.key});

  @override
  State<Destination> createState() => _DestinationState();
}

class _DestinationState extends State<Destination>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late List<Animation<Offset>> listSliding;

  final listOfItems = 10;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    listSliding = List.generate(
      listOfItems,
      (index) => Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(index * (1 / listOfItems), 1),
        ),
      ),
    );

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(title: Text('Hello Destination')),
      body: Center(
        child: ListView.builder(
          itemCount: listOfItems,
          itemBuilder: (context, index) {
            return SlideTransition(
              position: listSliding[index],
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  border: BoxBorder.all(width: 2, color: Colors.black38),
                ),
                child: ListTile(title: Text('Hello from Joshua')),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyCustomRouteTransiction extends PageRouteBuilder {
  final Widget route;
  MyCustomRouteTransiction({required this.route})
    : super(
        pageBuilder: (context, animatiom, secondaryAnimation) {
          return const Destination();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final anim = Tween<double>(
            begin: 0,
            end: 1,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));
          return FadeTransition(opacity: anim, child: child);
        },
      );
}
