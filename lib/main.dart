import 'package:ecommerce_app/blocs/counter_bloc/counter_bloc.dart';
import 'package:ecommerce_app/blocs/fakestore/fakestore_bloc.dart';
import 'package:ecommerce_app/blocs/login/login_bloc.dart';
import 'package:ecommerce_app/blocs/mobile/mobile_bloc.dart';
import 'package:ecommerce_app/blocs/notes/notes_bloc.dart';
import 'package:ecommerce_app/blocs/theme/theme_bloc.dart';
import 'package:ecommerce_app/blocs/theme/theme_state.dart';
import 'package:ecommerce_app/blocs/todo/todo_bloc.dart';
import 'package:ecommerce_app/blocs/weather/weather_bloc.dart';
import 'package:ecommerce_app/controller/weather_controller.dart';
import 'package:ecommerce_app/database/fakeStore_db_service.dart';
import 'package:ecommerce_app/database/note_db_service.dart';
import 'package:ecommerce_app/database/weather_db_service.dart';
import 'package:ecommerce_app/services/fakestore_service.dart';
import 'package:ecommerce_app/services/mobile_service.dart';
// import 'package:ecommerce_app/providers/counter_provider.dart';
// import 'package:ecommerce_app/providers/weather_provider.dart';
import 'package:ecommerce_app/services/weather_service.dart';
import 'package:ecommerce_app/views/counter_screen.dart';
import 'package:ecommerce_app/views/fakestore_screen.dart';
import 'package:ecommerce_app/views/home_screen.dart';
import 'package:ecommerce_app/views/login_screen.dart';
import 'package:ecommerce_app/views/mobile_screen.dart';
import 'package:ecommerce_app/views/notes_screen.dart';
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
    // WidgetsFlutterBinding.ensureInitialized();
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(
          create: (_) => WeatherBloc(WeatherService(), WeatherDbService()),
        ),
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => NotesBloc(NoteDbService())),
        BlocProvider(create: (_) => MobileBloc(MobileService())),
        BlocProvider(
          create: (_) =>
              FakeStoreBloc(FakestoreService(), FakestoreDbService()),
        ),
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
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: (state is DarkTheme) ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark(),
          theme: ThemeData.light(),
          title: 'Flutter Demo',

          home: FakestoreScreen(),
        );
      },
    );
  }
}
