import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int count = 0;
  void increament() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }

  void reset() {
    count = 0;
    notifyListeners();
  }
}
