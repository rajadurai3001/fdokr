import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '68e5018b7d3dca3302c19fb593ce7007'; // Replace with your OpenWeatherMap API key

  Future<Map<String, dynamic>> getWeather(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'; // Weather API URL

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body); // Return the decoded JSON response
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
