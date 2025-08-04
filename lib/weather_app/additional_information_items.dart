import 'package:flutter/material.dart';


class AdditionalInformationItems extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const AdditionalInformationItems({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

 @override
Widget build(BuildContext context) {
  return Column(
        children: [
           Icon(icon, size: 30, color: Colors.white),
          const SizedBox(height: 5), // Space between icon and text
          Text(label, style: TextStyle(fontSize: 16)),
          const SizedBox(height: 5), // Space between text and value
          Text(value, style: TextStyle(fontSize: 16)),
        ],
      );
}

}