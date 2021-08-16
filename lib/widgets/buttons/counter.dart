import 'dart:math';

import 'package:flutter/cupertino.dart';

class CounterProduct with ChangeNotifier {
  int _counter = 0;
  double _price = 0.00;
  final Random rand = Random();

  double get getPrice => _price;

  int get getCounter => _counter;

  void addBasket() {
    _price += rand.nextDouble() * 20;
    _counter++;
    notifyListeners();
  }
}
