import 'package:flutter/material.dart';

// Widgets
import '../widgets/create_counter.dart';

class Tasbih extends StatelessWidget {
  const Tasbih({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
