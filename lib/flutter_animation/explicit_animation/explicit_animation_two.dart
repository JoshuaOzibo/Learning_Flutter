import 'package:flutter/material.dart';

class ExplicitAnimationTwo extends StatefulWidget {
  const ExplicitAnimationTwo({super.key});

  @override
  State<ExplicitAnimationTwo> createState() => _ExplicitAnimationTwoState();
}

class _ExplicitAnimationTwoState extends State<ExplicitAnimationTwo>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(
      milliseconds: 2000
    ));
    slidingAnimation = Tween<Offset>(
      begin: Offset(-5, 1),
      end: Offset.zero,
    ).animate(controller);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SlideTransition(
              position: slidingAnimation,
              child: ListView(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Hello to List Animation'),
                      shape: BeveledRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.brown),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // SizedBox(height: 100),

          MaterialButton(
            onPressed: () =>  controller.forward(),
            child: Text('start animation'),
          ),
        ],
      ),
    );
  }
}
