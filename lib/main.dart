import 'package:ecommerce_app/blocs/counter_bloc/counter_bloc.dart';
import 'package:ecommerce_app/blocs/login/login_bloc.dart';
import 'package:ecommerce_app/blocs/todo/todo_bloc.dart';
import 'package:ecommerce_app/blocs/weather/weather_bloc.dart';
import 'package:ecommerce_app/controller/weather_controller.dart';
// import 'package:ecommerce_app/providers/counter_provider.dart';
// import 'package:ecommerce_app/providers/weather_provider.dart';
import 'package:ecommerce_app/services/weather_service.dart';
import 'package:ecommerce_app/views/counter_screen.dart';
import 'package:ecommerce_app/views/login_screen.dart';
import 'package:ecommerce_app/views/todo_screen.dart';
import 'package:ecommerce_app/views/weather_screen.dart';
// import 'package:ecommerce_app/views/home_screen.dart';
// import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

void main() {
  // WeatherService weatherService = WeatherService(
  //   "0b10461d5a30e6612ce19d84c97ef651#",
  // );
  // WeatherController weatherController = WeatherController(weatherService);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => WeatherBloc(WeatherService())),
      ],
      child: const MyApp(),
    ),

    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => CounterProvider()),
    //     ChangeNotifierProvider(create: (_) => ThemeProvider()),
    //     ChangeNotifierProvider(
    //       create: (_) => WeatherProvider(weatherController),
    //     ),
    //   ],
    //   child: const MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: themeProvider.themeMode,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      title: 'Flutter Demo',

      home: WeatherScreen(),
    );
  }
}
