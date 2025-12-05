import 'package:flutter/material.dart';

class CubitButton extends StatelessWidget {
  const CubitButton({
    super.key,
    required this.disabledColor,
    required this.submitHandler,
    required this.widget,
  });

  final Color disabledColor;
  final VoidCallback submitHandler;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.brown,
      disabledColor: disabledColor,
      elevation: 0,
      height: 50,
      minWidth: double.infinity,
      onPressed: submitHandler,
      child: Center(child: widget),
    );
  }
}
