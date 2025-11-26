import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text('Screen One'),
          Spacer(),
          MaterialButton(
            minWidth: double.infinity,
            color: Colors.lightBlue,
            child: Text('Continue'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OnboardingTwo())),
          ),
        ],
      ),
    );
  }
}

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text('Screen Two'),
          Spacer(),
          MaterialButton(
            minWidth: double.infinity,
            color: Colors.lightBlue,
            child: Text('Continue'),
            onPressed: () => print(''),
          ),
        ],
      ),
    );
  }
}
