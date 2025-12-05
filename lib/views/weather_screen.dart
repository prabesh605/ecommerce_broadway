import 'package:ecommerce_app/providers/weather_provider.dart';
import 'package:flutter/material.dart';
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
    final provider = Provider.of<WeatherProvider>(context);
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
              provider.isLoading?CircularProgressIndicator():
              OutlinedButton(
                onPressed: () async {
                  if (searchController.text.isNotEmpty) {
                    await provider.loadWeather(searchController.text);
                    print(provider.temparature);
                  }
                },
                child: Text("search"),
              ),
            ],
          ),
          provider.temparature != null
              ? Text("Your Temperature is ${provider.temparature}")
              : Text("Your Temperature is NUll"),
        ],
      ),
    );
  }
}
