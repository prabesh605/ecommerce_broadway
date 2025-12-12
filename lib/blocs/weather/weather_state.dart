import 'package:ecommerce_app/models/weather_model.dart';
import 'package:ecommerce_app/models/weather_offline_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  WeatherLoaded(this.weather);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

class WeatherOfflineLoaded extends WeatherState {
  final List<WeatherOfflineModel> weather;

  WeatherOfflineLoaded(this.weather);
}
