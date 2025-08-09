import 'package:flutter/material.dart';
import 'hourly_forecast_item.dart';
import 'additional_information_items.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart'; // for compute()
import './parse_weather.dart';

void main() {}

class WeatherAppPage extends StatefulWidget {
  const WeatherAppPage({super.key});

  @override
  State<WeatherAppPage> createState() => _WeatherAppPageState();
}

class _WeatherAppPageState extends State<WeatherAppPage> {
  final apiKey = dotenv.env['OPEN_WEATHER_API_KEY'];
  bool isLoading = true;
  double temperature = 0;
  String currentSkyIcon = '';
  double currentPressure = 0;
  double currentHumidity = 0;
  double currentWindSpeed = 0;
  List<Map<String, dynamic>> hourlyForecast = [];

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future<void> getCurrentWeather() async {
    final response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=London,uk&units=metric&APPID=$apiKey',
      ),
    );

    print('API Key: $apiKey');
    print('Fetching weather data...');

    try {
      if (response.statusCode == 200) {
        print('Weather data fetched successfully');
        final parsedData = await compute(parseWeather, response.body);
        print('Parsed weather data: $parsedData');
        final forecastList = (parsedData['list'] as List)
            .take(5)
            .map((item) => item as Map<String, dynamic>)
            .toList();

        final indexData = parsedData['list'][0];

        setState(() {
          hourlyForecast = forecastList;
          temperature = indexData['main']['temp'].toDouble();
          currentSkyIcon = indexData['weather'][0]['main'];
          currentPressure = indexData['main']['pressure'];
          currentHumidity = indexData['main']['humidity'];
          currentWindSpeed = indexData['wind']['speed'];
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error: $e');
      setState(() => isLoading = false);
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                getCurrentWeather();
              },
              icon: const Icon(Icons.refresh, size: 20),
              tooltip: 'Refresh',
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Container(color: Colors.blue.withOpacity(0.2)),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    '${temperature.toStringAsFixed(1)}°C',
                                    style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Icon(
                                    currentSkyIcon == 'Clear'
                                        ? Icons.sunny
                                        : Icons.cloud,
                                    size: 65,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    currentSkyIcon == 'Clear'
                                        ? 'Sunny'
                                        : 'Cloudy',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Weather Forecast',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hourlyForecast.length,
                      itemBuilder: (context, index) {
                        final forecast = hourlyForecast[index];
                        return HourlyForecastItem(
                          time: forecast['dt_txt'].split(' ')[1],
                          temperature: forecast['main']['temp'].toString(),
                          icon: forecast['weather'][0]['main'] == 'Clear'
                              ? Icons.sunny
                              : Icons.cloud,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Additional Information',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInformationItems(
                        icon: Icons.water_drop,
                        label: 'Humidity',
                        value: currentHumidity.toString(),
                      ),
                      AdditionalInformationItems(
                        icon: Icons.air,
                        label: 'Wind Speed',
                        value: currentWindSpeed.toString(),
                      ),
                      AdditionalInformationItems(
                        icon: Icons.beach_access,
                        label: 'Pressure',
                        value: currentPressure.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
