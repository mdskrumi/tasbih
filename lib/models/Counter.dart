import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  int get getId {
    return id;
  }

  Map toJson() => {
        'id': id,
        'counterName': counterName,
        'count': count,
        'date': date,
      };

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

  void createNewCounter(Counter counter) {
    _counters.add(counter);
    setCounterListInSharedPref();
    notifyListeners();
  }

  Counter getCounterById(id) {
    return _counters.firstWhere((element) => element.id == id);
  }

  void deleteCounterById(id) {
    _counters.removeWhere((element) => element.id == id);
    setCounterListInSharedPref();
    notifyListeners();
  }

  void increaseCounterById(id) {
    final index = _counters.indexWhere((element) => element.id == id);
    _counters[index].count += 1;
    setCounterListInSharedPref();
    notifyListeners();
  }

  void setCounterListInSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('_counters', jsonEncode(_counters));
  }

  void getCounterListInSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('_counters')) {
      (jsonDecode(prefs.get('_counters') as String) as List).forEach((element) {
        final value = Counter(
          id: element['id'],
          counterName: element['counterName'],
          count: element['count'],
          date: element['date'],
        );
        _counters.add(value);
      });
    }
    notifyListeners();
  }
}
