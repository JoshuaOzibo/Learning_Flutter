import 'package:flutter/material.dart';



// This widget represents an item in the hourly forecast section
// It displays the time, weather icon, and temperature
class HourlyForecastItem extends StatelessWidget {
  // Constructor for HourlyForecastItem
  final String time;
  final String temperature;
  final IconData icon;
  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6, // Add shadow for depth
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: 100, // Fixed width for the card
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:  Column(
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8), // Space between time and icon
              const Icon(Icons.cloud, size: 30, color: Colors.white),
              const SizedBox(height: 5), // Space between icon and temperature
              Text(temperature, style: TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }
}
