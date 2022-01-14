import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    Widget bookImage() => Image.asset(
          'assets/icon/book.gif',
          height: 32,
          width: 32,
          cacheHeight: 32,
          cacheWidth: 32,
        );

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16, 8.0, 0),
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: mq.size.height / 2 > 100 ? 100 : mq.size.height / 2,
        ),
        children: [
          GestureDetector(
            onTap: () {},
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    bookImage(),
                    const Text(
                      "Muntakhab Hadis",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
