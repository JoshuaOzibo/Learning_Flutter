import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.handleSubscribeButton,
    required this.emailController,
    required this.onChangedVal
  });

  final VoidCallback handleSubscribeButton;
  final TextEditingController emailController;
  final Function onChangedVal;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        TextField(
          autocorrect: true,
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          onChanged: (value) => onChangedVal(value),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.blueGrey, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(30),
            ),
            contentPadding: EdgeInsets.all(20),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.green),
            ),
            hint: Text('Enter email'),
            label: Text('Hello'),
          ),
        ),

        MaterialButton(
          color: Colors.brown,
          height: 50,
          minWidth: double.infinity,
          onPressed: handleSubscribeButton,
          child: Text('Subscribed', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
