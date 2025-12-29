import 'package:flutter/material.dart';

class EmailAndPasswordInput extends StatelessWidget {
  const EmailAndPasswordInput({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.handleSubmitLogin,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback handleSubmitLogin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        spacing: 20,
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextField(
              controller: emailController,
              autocorrect: true,
              decoration: InputDecoration(hint: Text('enter email')),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextField(
              controller: passwordController,
              autocorrect: true,
              decoration: InputDecoration(hint: Text('enter password')),
            ),
          ),
      
          MaterialButton(
            onPressed: handleSubmitLogin,
            height: 50,
            elevation: 0,
            highlightElevation: 0,
            color: Colors.blueGrey,
            minWidth: double.infinity,
            child: Text('Submit', style: TextStyle(
              color: Colors.black
            ),),
          ),
        ],
      ),
    );
  }
}
