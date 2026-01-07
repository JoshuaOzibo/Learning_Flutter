import 'package:flutter/material.dart';
import 'package:flutter_application_1/full_auth_practice/presentation/bubble_container.dart';
import 'package:flutter_application_1/full_auth_practice/presentation/form_inputs/email_and_password_input.dart';

class FormAuthScreen extends StatefulWidget {
  const FormAuthScreen({super.key});

  @override
  State<FormAuthScreen> createState() => _FormAuthScreenState();
}

class _FormAuthScreenState extends State<FormAuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  handleSubmitLogin() {
    print('object');
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      return;
    }
    print({
      "email": "${_emailController.text}",
      "password": "${_passwordController.text}",
    });

    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BubbleContainer(
          pointerLocation: BubblePointerLocation.top,
          pointerOffset: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What’s your full name?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: "Full name",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: "Full name",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        // child: EmailAndPasswordInput(
        //   emailController: _emailController,
        //   passwordController: _passwordController,
        //   handleSubmitLogin: handleSubmitLogin,
        // ),
      ),
    );
  }
}
