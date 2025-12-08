import 'dart:convert';

import 'package:ecommerce_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  // final String apiKey;
  // WeatherService(this.apiKey);
  WeatherService();
  // = "0b10461d5a30e6612ce19d84c97ef651#";
  Future<Weather> fetchWeather(String cityName) async {
    try {
      String apiKey = '0b10461d5a30e6612ce19d84c97ef651#';
      final baseUrl =
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey";

      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final weatherData = Weather.fromJson(jsonData);
        return weatherData;
      } else {
        throw 'Error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
