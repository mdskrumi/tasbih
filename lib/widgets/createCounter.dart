import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

// Modals
import '../models/Counter.dart';

class CreateCounter extends StatefulWidget {
  const CreateCounter({Key? key}) : super(key: key);

  @override
  State<CreateCounter> createState() => _CreateCounterState();
}

class _CreateCounterState extends State<CreateCounter> {
  TextEditingController counterNameController = TextEditingController();
  TextEditingController counterController = TextEditingController();

  late FocusNode counterFocusNode;

  Random rand = Random();
  final DateFormat formatter = DateFormat.jm().add_yMEd();

  bool counterNameValidate = false;
  bool counterValidate = false;

  @override
  void initState() {
    super.initState();
    counterFocusNode = FocusNode();
  }

  @override
  void dispose() {
    counterFocusNode.dispose();
    // counterNameController.dispose();
    // counterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void handleCreateNewCounter() {
      if (counterNameController.text.isEmpty) {
        setState(() {
          counterNameValidate = true;
        });
        return;
      }
      String counterName = counterNameController.text;
      int count = counterController.text.isEmpty
          ? 0
          : int.parse(counterController.text) > 0
              ? int.parse(counterController.text)
              : 0;

      final counter = Counter(
        id: DateTime.now().millisecond + rand.nextInt(1000),
        counterName: counterName,
        count: count,
        date: formatter.format(
          DateTime.now(),
        ),
        updatedDate: formatter.format(
          DateTime.now(),
        ),
      );

      Provider.of<CounterList>(context, listen: false)
          .createNewCounter(counter);
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed('/counter-page', arguments: counter);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            controller: counterNameController,
            decoration: InputDecoration(
              hintText: 'Counter Name',
              errorText:
                  (counterNameValidate) ? "This field is required." : null,
            ),
            textInputAction: TextInputAction.next,
            textAlign: TextAlign.center,
          ),
          TextField(
            controller: counterController,
            focusNode: counterFocusNode,
            decoration: const InputDecoration(
              hintText: 'Initial Number',
              helperText: "Default '0'",
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onSubmitted: (_) => handleCreateNewCounter,
          ),
          TextButton(
            onPressed: handleCreateNewCounter,
            child: const Text(
              "Create",
            ),
          )
        ],
      ),
    );
  }
}
