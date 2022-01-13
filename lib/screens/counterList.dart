import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Modals
import '../models/Counter.dart';

class CounterListPage extends StatelessWidget {
  const CounterListPage({Key? key}) : super(key: key);
  static const route = '/counter-list';

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterList>(context, listen: true);
    var counterList = counterProvider.counters;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter List"),
      ),
      body: counterList.isEmpty
          ? const Center(
              child: Text(
                "No Counts Found",
                style: TextStyle(fontSize: 24),
              ),
            )
          : ListView.builder(
              itemCount: counterList.length,
              itemBuilder: (ctx, i) => Dismissible(
                key: UniqueKey(),
                background: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.delete,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                  padding: const EdgeInsets.all(5),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (dir) {
                  counterProvider.deleteCounterById(counterList[i].id);
                },
                confirmDismiss: (direction) {
                  return showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: const Text('Delete This Count'),
                        content: const Text(
                            "Do you really want to delete this count?"),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              "No",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => Navigator.of(ctx).pop(false),
                          ),
                          TextButton(
                            child: const Text(
                              "Yes",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => Navigator.of(ctx).pop(true),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Card(
                  elevation: 2,
                  shadowColor: Theme.of(context).primaryColorDark,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(counterList[i].counterName),
                        Text(
                          'Created at: ' + counterList[i].date,
                          style: const TextStyle(fontSize: 10),
                        ),
                        Text(
                          'Updated at: ' + counterList[i].updatedDate,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    trailing: Text(
                      counterList[i].count.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/counter-page',
                          arguments: counterList[i]);
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Delete This Count'),
                          content: const Text(
                              "Do you really want to delete this count?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'No'),
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                counterProvider
                                    .deleteCounterById(counterList[i].id);
                                return Navigator.pop(context, 'Yes');
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
