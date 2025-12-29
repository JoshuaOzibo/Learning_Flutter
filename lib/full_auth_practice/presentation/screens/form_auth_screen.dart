import 'package:flutter/material.dart';
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

    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmailAndPasswordInput(
          emailController: _emailController,
          passwordController: _passwordController,
          handleSubmitLogin: handleSubmitLogin,
        ),
      ),
    );
  }
}
