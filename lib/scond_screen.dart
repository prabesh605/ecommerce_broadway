import 'package:ecommerce_app/counter_provider.dart';
import 'package:ecommerce_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScondScreen extends StatelessWidget {
  const ScondScreen({super.key});
  // final int counterValue;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: Column(
          children: [
            Text(
              "${provider.count}",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text("Home Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
