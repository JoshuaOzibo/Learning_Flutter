
import 'dart:convert';

Map<String, dynamic> parseWeather(String responseBody) {
  return jsonDecode(responseBody) as Map<String, dynamic>;
}
