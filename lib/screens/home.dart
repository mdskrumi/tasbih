import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// Modals
import '../models/Counter.dart';

// Widgets
import '../widgets/createCounter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<CounterList>(context, listen: false)
        .getCounterListInSharedPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context).size;
    // final counterProvider = Provider.of<CounterList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasbih"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '﷽',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 48),
                  ),
                  Text(
                    "Tasbih",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 36),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return const Center(
                            child: CreateCounter(),
                          );
                        });
                  },
                  child: const Text('New Count'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/counter-list');
                  },
                  child: const Text('Get List of Previous Counts'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
