import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Modals
import './models/Counter.dart';

// Screens
import './screens/home.dart';
import './screens/counterList.dart';
import './screens/CounterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CounterList(),
      builder: (ctx, _) => MaterialApp(
        title: 'Tasbih',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
          primarySwatch: Colors.brown,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.brown,
              ),
        ),
        home: const HomePage(),
        routes: {
          // HomePage.route: (ctx) => const HomePage(),
          CounterListPage.route: (ctx) => const CounterListPage(),
          CounterPage.route: (ctx) => const CounterPage(),
        },
      ),
    );
  }
}
