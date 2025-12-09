import 'package:flutter/material.dart';
import 'package:flutter_application_1/learning_auth/widgets/email_field.dart';

class LearningAuthScreen extends StatefulWidget {
  const LearningAuthScreen({super.key});

  @override
  State<LearningAuthScreen> createState() => _LearningAuthScreenState();
}

class _LearningAuthScreenState extends State<LearningAuthScreen> {
  final TextEditingController emailController = TextEditingController();

  void handleSubscribeButton() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailField(
                handleSubscribeButton: handleSubscribeButton,
                emailController: emailController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
