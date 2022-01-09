import 'package:flutter/material.dart';

class Counter {
  final int id;
  final String counterName;
  int count;
  final String date;

  Counter({
    required this.id,
    required this.counterName,
    this.count = 0,
    required this.date,
  });

  @override
  String toString() {
    return '$id $counterName $count $date';
  }
}

class CounterList with ChangeNotifier {
  final List<Counter> _counters = [];

  List<Counter> get counters {
    return _counters.toList();
  }

  void createNewCounter(counter) {
    _counters.add(counter);
    notifyListeners();
  }

  Counter getCounterById(id) {
    return _counters.firstWhere((element) => element.id == id);
  }

  void deleteCounterById(id) {
    _counters.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void increaseCounterById(id) {
    final index = _counters.indexWhere((element) => element.id == id);
    _counters[index].count += 1;
    notifyListeners();
  }
}
