import 'package:flutter/material.dart';

class CubitForm extends StatelessWidget {
  const CubitForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        TextField(
          controller: emailController,
          style: TextStyle(),
          decoration: InputDecoration(
            hint: Text('Enter email'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 1, color: Colors.brown),
            ),
          ),
        ),
        TextField(
          controller: passwordController,
          style: TextStyle(),
          decoration: InputDecoration(
            hint: Text('Enter password'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 1, color: Colors.brown),
            ),
          ),
        ),
      ],
    );
  }
}
