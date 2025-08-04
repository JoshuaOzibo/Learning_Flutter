import 'package:flutter/material.dart';
import 'dart:ui';

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
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.refresh, size: 20),
              tooltip: 'Refresh', // Tooltip for the refresh button
            ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity, // Make the card take full width
              child: Card(
                elevation: 10, // Add shadow for depth
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRect(
                  // Clip the content to the card's shape
                  // borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    // Apply blur effect
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '300 °C',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ), // Space between temperature and icon

                          Icon(Icons.cloud, size: 65, color: Colors.white),

                          SizedBox(height: 15), // Space between icon and text
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
                ),
              ),
            ),

            const SizedBox(height: 20), // Space between placeholders

            const Text(
              'Weather Forcast',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                ],
              ),
            ),

            const SizedBox(height: 20), // Space between placeholders

            const Text(
              'Additional Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10), // Space between title and content

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.water_drop, size: 30, color: Colors.white),
                    const SizedBox(height: 5), // Space between icon and text
                    const Text('Humidity', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 5), // Space between text and value
                    const Text('94', style: TextStyle(fontSize: 16)),
                  ],
                ),

                Column(
                  children: [
                    Icon(Icons.air, size: 30, color: Colors.white),
                    const SizedBox(height: 5), // Space between icon and text
                    const Text('Wind', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 5), // Space between text and value
                    const Text('2.1 m/s', style: TextStyle(fontSize: 16)),
                  ],
                ),

                Column(
                  children: [
                    Icon(Icons.sunny, size: 30, color: Colors.white),
                    const SizedBox(height: 5), // Space between icon and text
                    const Text('UV Index', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 5), // Space between text and value
                    const Text('3', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// This widget represents an item in the hourly forecast section
// It displays the time, weather icon, and temperature

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6, // Add shadow for depth
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: 100, // Fixed width for the card
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: const Column(
            children: [
              Text(
                '09:00',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8), // Space between time and icon
              Icon(Icons.cloud, size: 30, color: Colors.white),
              SizedBox(height: 5), // Space between icon and temperature
              Text('301.17', style: TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }
}
