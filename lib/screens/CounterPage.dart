import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Modals
import '../models/Counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);
  static const route = '/counter-page';

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterList>(context);
    final counter = ModalRoute.of(context)!.settings.arguments as Counter;

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(counter.counterName),
        ),
      ),
      body: InkWell(
        onTap: () {
          counterProvider.increaseCounterById(counter.id);
        },
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: FittedBox(
                  child: Text(
                    counter.count.toString(),
                    style: const TextStyle(
                      fontSize: 64,
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              'Touch anywhere to increase the counter',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
