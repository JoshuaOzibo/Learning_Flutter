import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'hourly_forecast_item.dart';
import 'additional_information_items.dart';
import 'secret.dart'; // Import your secret file for API key
import 'package:http/http.dart' as http;

void main() {}

class WeatherAppPage extends StatefulWidget {
  const WeatherAppPage({super.key});

  @override
  State<WeatherAppPage> createState() => _WeatherAppPageState();
}

class _WeatherAppPageState extends State<WeatherAppPage> {

   bool isLoading = true;
  double temperature = 0; // Example temperature in Kelvin
  String currentSkyIcon = '';
  double currentPressure = 0;
  double currentHumidity = 0;
  double currentWindSpeed = 0;
  List<Map<String, dynamic>> hourlyForecast = [];


  @override
  void initState() {
    super.initState();
    // Fetch current weather data when the page is initialized
    getCurrentWeather();
  }

  // function to get the current weather data
  Future<void> getCurrentWeather() async {
  final response = await http.get(
    Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=London,uk&units=metric&APPID=$openWeatherAPIKey')

  );

 try{
  if (response.statusCode == 200) {
    print(response.statusCode);
    final data = jsonDecode(response.body);
    // print(response.body); // Print the raw response for debugging
     // print(data); // Print the fetched data for debugging
     
     setState(() {
      hourlyForecast = (data['list'] as List).take(5).map((item) => item as Map<String, dynamic>).toList(); // take the first 5 items from the list
     final indexData = data['list'][0];


      temperature = indexData['main']['temp'].toDouble();
      currentSkyIcon = indexData['weather'][0]['main'];
      currentPressure = indexData['main']['pressure'];
      currentHumidity = indexData['main']['humidity'];
      currentWindSpeed = indexData['wind']['speed'];
      isLoading = false;
    });

    
  } else {
    throw Exception('Failed to load weather data');
  }
 } catch (e) {
  print('Error: $e');
 }
}


  
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
      body: isLoading ? const Center(child: CircularProgressIndicator()) : Padding(
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
                  child:  BackdropFilter(
                    // Apply blur effect
                    filter:  ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '${temperature.toStringAsFixed(1)} K', // Display temperature in Kelvin
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ), // Space between temperature and icon

                          Icon(
                            currentSkyIcon == 'Clear' ? Icons.sunny : Icons.cloud, size: 65, color: Colors.white),

                         const  SizedBox(height: 15), // Space between icon and text
                          Text(
                            currentSkyIcon == 'Clear' ? 'Sunny' : 'Cloudy',
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
              style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(
                    height: 120, // Fixed height for smoother scrolling
                    child: ListView.builder( // use ListView.builder to build the list of hourly forecast items
                      scrollDirection: Axis.horizontal,
                      itemCount: hourlyForecast.length,
                      itemBuilder: (context, index) {
                        final forecast = hourlyForecast[index];
                        return HourlyForecastItem(
                          time: forecast['dt_txt'].split(' ')[1],
                          temperature: forecast['main']['temp'].toString(),
                          icon: forecast['weather'][0]['main'] == 'Clear' ? Icons.sunny : Icons.cloud,
                        );
                      },
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
                AdditionalInformationItems(icon: Icons.water_drop, label: 'Humidity', value: currentHumidity.toString()),
                AdditionalInformationItems( icon: Icons.air, label: 'Wind Speed', value: currentWindSpeed.toString()),
                AdditionalInformationItems( icon: Icons.beach_access, label: 'pressure', value: currentPressure.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
