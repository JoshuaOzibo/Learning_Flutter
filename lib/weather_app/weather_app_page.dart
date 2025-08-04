import 'package:flutter/material.dart';

void main() {}

class WeatherAppPage extends StatelessWidget {
  const WeatherAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

        // backgroundColor: Colors.blueAccent, // Uncomment to set a custom background color for the app bar
        // toolbarHeight: 100, // Uncomment to set a custom height for the app bar
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 25),
          ),
          // IconButton(
          //   onPressed: () {
          //     // Add your refresh logic here
          //     print('Refresh tapped');
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: const Icon(Icons.refresh, size: 30),
          //   ),

          // )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity, // Make the card take full width
              child: Card(
                child: Column(
                  children: [
                    Text(
                      '300 °C',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ), // Space between temperature and icon

                    Icon(Icons.cloud, size: 65, color: Colors.white),

                    const SizedBox(height: 15), // Space between icon and text
                    Text(
                      'Rain',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20), // Space between placeholders

            const Placeholder(fallbackHeight: 150, color: Colors.greenAccent),

            const SizedBox(height: 20), // Space between placeholders

            const Placeholder(fallbackHeight: 100, color: Colors.redAccent),
          ],
        ),
      ),
    );
  }
}
