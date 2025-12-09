import 'package:flutter/material.dart';
import 'package:flutter_application_1/learning_auth/widgets/email_field.dart';

class LearningAuthScreen extends StatelessWidget {
  const LearningAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      body: Expanded(child: Center(
        child: EmailField(),
      )),
    );
  }
}