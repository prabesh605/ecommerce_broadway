import 'package:ecommerce_app/blocs/weather/weather_event.dart';
import 'package:ecommerce_app/blocs/weather/weather_state.dart';
import 'package:ecommerce_app/database/db.dart';
import 'package:ecommerce_app/database/weather_db_service.dart';
import 'package:ecommerce_app/models/weather_offline_model.dart';
import 'package:ecommerce_app/services/weather_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherService weatherService;
  WeatherDbService weatherDbService;
  WeatherBloc(this.weatherService, this.weatherDbService)
    : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());

      try {
        final weather = await weatherService.fetchWeather(event.cityName);
        final offlineWeather = WeatherOfflineModel(
          city: weather.name,
          temp: weather.main.temp,
          cod: weather.cod,
        );

        final data = await weatherDbService.insertWeather(offlineWeather);
        if (data > 0) {
          final actualData = await weatherDbService.getWeather();
          emit(WeatherOfflineLoaded(actualData));
        } else {
          emit(WeatherError("Error saving offline"));
        }

        //city
        //temp
        //cod
        // emit(WeatherLoaded(weather));
        // emit(WeatherOfflineLoaded());
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
    on<GetOfflineWeather>((event, emit) async {
      final data = await weatherDbService.getWeather();
      emit(WeatherOfflineLoaded(data));
    });
  }
}
