import 'package:ecommerce_app/bloc/counter_bloc.dart';
import 'package:ecommerce_app/bloc/counter_event.dart';
import 'package:ecommerce_app/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter with Bloc")),
      body: Column(
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              if (state is CounterSuccess) {
                return Text(
                  state.value.toString(),
                  style: TextStyle(fontSize: 60),
                );
              }
              if (state is CounterError) {
                return Text(
                  "Error",
                  // state.value.toString(),
                  style: TextStyle(fontSize: 60),
                );
              }
              if (state is InternetProblem) {
                return Text("No Internet");
              }
              return Text("999", style: TextStyle(fontSize: 60));
            },
          ),

          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  context.read<CounterBloc>().add(Increment());
                },
                icon: Icon(Icons.add, size: 20),
              ),
              IconButton(
                onPressed: () {
                  context.read<CounterBloc>().add(Decrement());
                },
                icon: Icon(Icons.remove, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
