import 'package:aquaculture/Weatherservices.dart';
import 'package:aquaculture/dashboard.dart';
import 'package:flutter/material.dart';
import 'Weather.dart'; 
import 'package:aquaculture/dashboard.dart';// Import the WeatherService file

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});
    @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String city = "London";  // Default city
  String temperature = "";
  String description = "";
  String humidity = "";
  String windSpeed = "";
  bool isLoading = false;

  final WeatherService weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    getWeatherData(city);
  }

  Future<void> getWeatherData(String city) async {
    setState(() {
      isLoading = true;
    });
    try {
      final weatherData = await weatherService.getWeather(city);
      setState(() {
        temperature = '${weatherData['main']['temp']}°C';
        description = weatherData['weather'][0]['description'];
        humidity = '${weatherData['main']['humidity']}%';
        windSpeed = '${weatherData['wind']['speed']} m/s';
      });
    } catch (e) {
      setState(() {
        temperature = "Error fetching data";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:100),
              child: SizedBox(
                width:145,
                child: TextField(
                  onSubmitted: (value) {
                    setState(() {
                      city = value;
                    });
                    getWeatherData(city);
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    labelText: 'Enter City Name',
                    border: OutlineInputBorder(),
                     isDense: true,  // Makes the field more compact
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), // Adjusts padding
                  ),
                ),
              ),
            ),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                  padding: const EdgeInsets.only(left: 200,top: 2),
                  child:Container(
                      child: Column(
                        children: [
     Text(" $temperature",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
       Text(" $city",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                ),
          ],
        ),
      ),
      ],
    );
  }
}
