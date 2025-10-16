import 'package:flutter/material.dart';

class ExplicitAnimationTwo extends StatefulWidget {
  const ExplicitAnimationTwo({super.key});

  @override
  State<ExplicitAnimationTwo> createState() => _ExplicitAnimationTwoState();
}

class _ExplicitAnimationTwoState extends State<ExplicitAnimationTwo>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late List<Animation<Offset>> _animationPosition;

  final int listToGenerate = 5;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _animationPosition = List.generate(
      listToGenerate,
      (int index) => Tween(begin: Offset(-1, 0), end: Offset.zero).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(index * (1 / listToGenerate), 1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listToGenerate,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: _animationPosition[index],
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 5, right: 5, left: 5),
              child: ListTile(title: Text('Hello my Name is Joshua')),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (animationController.isCompleted) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
        },
        child: Text('Click'),
      ),
    );
  }
}
