import 'package:ecommerce_app/blocs/weather/weather_event.dart';
import 'package:ecommerce_app/blocs/weather/weather_state.dart';
import 'package:ecommerce_app/services/weather_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherService weatherService;
  WeatherBloc(this.weatherService) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());

      try {
        final weather = await weatherService.fetchWeather(event.cityName);
        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
  }
}
