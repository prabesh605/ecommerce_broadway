import 'package:ecommerce_app/blocs/theme/theme_bloc.dart';
import 'package:ecommerce_app/blocs/theme/theme_event.dart';
import 'package:ecommerce_app/blocs/theme/theme_state.dart';
import 'package:ecommerce_app/providers/counter_provider.dart';
// import 'package:ecommerce_app/first_screen.dart';
import 'package:ecommerce_app/providers/theme_provider.dart';
import 'package:ecommerce_app/views/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<CounterProvider>(context);
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Bloc"),
            actions: [
              Switch(
                value: (state is DarkTheme) ? true : false,
                onChanged: (value) {
                  context.read<ThemeBloc>().add(ChangeTheme());
                },
              ),
            ],
          ),
          body: Center(
            child: Column(
              children: [
                Text((state is DarkTheme) ? "Dark Mode" : "Light Mode"),
                // Text(
                //   '${provider.count}',
                //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                // ),
                // Consumer<CounterProvider>(
                //   builder: (_, a, child) {
                //     return Text("${provider.count}");
                //   },
                // ),

                // Consumer<CounterProvider>(
                //   builder: (_, a, child) {
                //     return Text("Error here");
                //   },
                // ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // provider.increament();
                      },
                      icon: Icon(Icons.add, size: 40),
                    ),
                    IconButton(
                      onPressed: () {
                        // provider.decrement();
                      },
                      icon: Icon(Icons.remove, size: 40),
                    ),
                  ],
                ),
                // OutlinedButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => FirstScreen()),
                //     );
                //   },
                //   child: Text("First Screen"),
                // ),
                SizedBox(height: 60),
                OutlinedButton(
                  onPressed: () {
                    // provider.reset();
                  },
                  child: Text("Reset"),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WeatherScreen()),
                    );
                  },
                  child: Text("Weather Screen"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
