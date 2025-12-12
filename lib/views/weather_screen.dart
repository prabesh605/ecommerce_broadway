import 'package:ecommerce_app/blocs/weather/weather_bloc.dart';
import 'package:ecommerce_app/blocs/weather/weather_event.dart';
import 'package:ecommerce_app/blocs/weather/weather_state.dart';
// import 'package:ecommerce_app/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Weather Screen")),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              // provider.isLoading?CircularProgressIndicator():
              OutlinedButton(
                onPressed: () async {
                  if (searchController.text.isNotEmpty) {
                    final cityName = searchController.text;

                    context.read<WeatherBloc>().add(FetchWeather(cityName));

                    // await provider.loadWeather(searchController.text);
                    // print(provider.temparature);
                  }
                },
                child: Text("search"),
              ),
            ],
          ),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return CircularProgressIndicator();
              } else if (state is WeatherLoaded) {
                return Text("Temperature is ${state.weather.main.temp}");
              } else if (state is WeatherOfflineLoaded) {
                // return Text("Temperature is ${state.weather.first.temp}");
                final data = state.weather;
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final weatherdata = data[index];
                      return ListTile(
                        leading: Text("${weatherdata.id}"),
                        title: Text("Temperature is ${weatherdata.temp}"),
                        subtitle: Text("${weatherdata.city}"),
                      );
                    },
                  ),
                );
              } else if (state is WeatherError) {
                return Text(state.message);
              }
              return Container();
            },
          ),
          // provider.temparature != null
          //     ? Text("Your Temperature is ${provider.temparature}")
          //     : Text("Your Temperature is NUll"),
        ],
      ),
    );
  }
}
