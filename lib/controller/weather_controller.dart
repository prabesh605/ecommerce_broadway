import 'package:ecommerce_app/models/weather_model.dart';
import 'package:ecommerce_app/services/weather_service.dart';

class WeatherController {
  final WeatherService weatherService;
  WeatherController(this.weatherService);

  Future<Weather> getWeather(String city) {
    return weatherService.fetchWeather(city);
  }
}
