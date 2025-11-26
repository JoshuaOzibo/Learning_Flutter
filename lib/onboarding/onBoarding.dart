import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  List<int> pagination = [1, 2, 3, 4];

  void nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInExpo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            _pageController.page.toString(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          PageView(
            controller: _pageController,
            children: [
              OnboardingOne(nextScreen: nextPage),
              OnboardingTwo(nextScreen: nextPage),
              OnboardingThree(nextScreen: nextPage),
              OnboardingFour(nextScreen: nextPage),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key, required this.nextScreen});

  final VoidCallback nextScreen;

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
            onPressed: nextScreen,
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }
}

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key, required this.nextScreen});

  final VoidCallback nextScreen;

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
            onPressed: nextScreen,
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }
}

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({super.key, required this.nextScreen});

  final VoidCallback nextScreen;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text('Screen Three'),
          Spacer(),
          MaterialButton(
            minWidth: double.infinity,
            color: Colors.lightBlue,
            onPressed: nextScreen,
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }
}

class OnboardingFour extends StatelessWidget {
  const OnboardingFour({super.key, required this.nextScreen});

  final VoidCallback nextScreen;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text('Screen Four'),
          Spacer(),
          MaterialButton(
            minWidth: double.infinity,
            color: Colors.lightBlue,
            onPressed: nextScreen,
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }
}
