import 'package:ecommerce_app/controller/weather_controller.dart';
import 'package:ecommerce_app/models/weather_model.dart';
import 'package:ecommerce_app/services/weather_service.dart';
import 'package:flutter/material.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherController weatherController;
  WeatherProvider(this.weatherController);
  double? temparature;
  String? name;

  Future<void> loadWeather(String cityName) async {
    final Weather weather = await weatherController.getWeather(cityName);
    temparature = weather.main.temp;
    name = weather.name;
    notifyListeners();
  }
}
