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
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          primarySwatch: Colors.green,
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
