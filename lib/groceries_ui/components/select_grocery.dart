
import 'package:flutter/material.dart';

class SelectGrocery extends StatelessWidget {
  const SelectGrocery({super.key, required this.filterBy});

  final String filterBy;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      margin: const EdgeInsets.only(right: 10),
      child: Text(filterBy, style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
    );
  }
}