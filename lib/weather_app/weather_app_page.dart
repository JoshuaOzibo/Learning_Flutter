import 'package:flutter/material.dart';
import 'dart:ui';
import 'hourly_forecast_item.dart';
import 'additional_information_items.dart';

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
            // Title for hourly forecast section
            const Text(
              'Weather Forcast',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem( time: '09:00', temperature: '300 °C'),
                  HourlyForecastItem( time: '09:00', temperature: '300 °C'),
                  HourlyForecastItem( time: '09:00', temperature: '300 °C'),
                  HourlyForecastItem( time: '09:00', temperature: '300 °C'),
                  HourlyForecastItem( time: '09:00', temperature: '300 °C'),
                ],
              ),
            ),

            const SizedBox(height: 20), // Space between placeholders
            // // Title for additional information section
            const Text(
              'Additional Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10), // Space between title and content
            // // Display additional information items in a row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const AdditionalInformationItems(icon: Icons.water_drop, label: 'Humidity', value: '60%'),
                const AdditionalInformationItems( icon: Icons.air, label: 'Wind Speed', value: '7.5'),
                const AdditionalInformationItems( icon: Icons.beach_access, label: 'pressure', value: '1000'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
