import 'package:ecommerce_app/counter_provider.dart';
import 'package:ecommerce_app/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Provider")),
      body: Center(
        child: Column(
          children: [
            Text(
              '${provider.count}',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    provider.increament();
                  },
                  icon: Icon(Icons.add, size: 40),
                ),
                IconButton(
                  onPressed: () {
                    provider.decrement();
                  },
                  icon: Icon(Icons.remove, size: 40),
                ),
              ],
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstScreen()),
                );
              },
              child: Text("First Screen"),
            ),
            SizedBox(height: 60),
            OutlinedButton(
              onPressed: () {
                provider.reset();
              },
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
