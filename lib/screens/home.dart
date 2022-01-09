import 'package:flutter/material.dart';

// Widgets
import '../widgets/createCounter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasbih"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'In The Name Of Allah',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 36),
                    ),
                    Text(
                      '...THE EVER LIVING...',
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
      ),
    );
  }
}
