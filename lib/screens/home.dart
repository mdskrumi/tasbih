import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// Modals
import '../models/counter.dart';

// Widgets
import '../widgets/tasbih.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageNumber = 0;

  @override
  void initState() {
    Provider.of<CounterList>(context, listen: false)
        .getCounterListInSharedPref();
    super.initState();
  }

  void handleChangePageNumber(int num) {
    setState(() {
      pageNumber = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context).size;
    // final counterProvider = Provider.of<CounterList>(context);

    return SafeArea(
      child: Scaffold(
        body: pageNumber == 0 ? const Tasbih() : null,
        bottomNavigationBar: BottomNavBar(pageNumber, handleChangePageNumber),
      ),
    );
  }
}
