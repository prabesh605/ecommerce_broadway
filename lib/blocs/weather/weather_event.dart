import 'package:ecommerce_app/models/weather_offline_model.dart';

abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final String cityName;
  FetchWeather(this.cityName);
}

class GetOfflineWeather extends WeatherEvent {
  final WeatherOfflineModel weather;

  GetOfflineWeather(this.weather);
}
