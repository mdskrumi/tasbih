import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int pageNumber;
  final Function handleChangePageNumber;
  const BottomNavBar(this.pageNumber, this.handleChangePageNumber, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.blur_circular),
          label: 'Tasbih',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
      ],
      currentIndex: pageNumber,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        handleChangePageNumber(index);
      },
    );
  }
}
