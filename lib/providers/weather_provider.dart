import 'package:ecommerce_app/controller/weather_controller.dart';
import 'package:ecommerce_app/models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherController weatherController;
  WeatherProvider(this.weatherController);
  double? temparature;
  String? name;
  bool isLoading = false;

  Future<void> loadWeather(String cityName) async {
    isLoading = true;
    final Weather weather = await weatherController.getWeather(cityName);
    temparature = weather.main.temp;
    name = weather.name;
    isLoading = false;
    notifyListeners();
  }
}
