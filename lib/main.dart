import 'package:ecommerce_app/controller/weather_controller.dart';
import 'package:ecommerce_app/providers/counter_provider.dart';
import 'package:ecommerce_app/providers/weather_provider.dart';
import 'package:ecommerce_app/services/weather_service.dart';
import 'package:ecommerce_app/views/home_screen.dart';
import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WeatherService weatherService = WeatherService(
    "0b10461d5a30e6612ce19d84c97ef651#",
  );
  WeatherController weatherController = WeatherController(weatherService);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(weatherController),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      title: 'Flutter Demo',

      home: HomeScreen(),
    );
  }
}
