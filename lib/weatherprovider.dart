import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier {
  String temperature = '';
  String description = '';
  
  // Function to update weather data
  void updateWeatherData(String temp, String desc) {
    temperature = temp;
    description = desc;
    notifyListeners();
  }
}
