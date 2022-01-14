import 'package:flutter/material.dart';

// Models
import '../models/name.dart';

class AllahNameScreen extends StatelessWidget {
  const AllahNameScreen({Key? key}) : super(key: key);
  static const route = '/Allah-names';

  @override
  Widget build(BuildContext context) {
    final lang = ModalRoute.of(context)!.settings.arguments as String;

    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: AllahNames.names.length,
          itemBuilder: (ctx, index) {
            return lang == 'en'
                ? Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AllahNames.names[index].nameAr),
                        Text(AllahNames.names[index].nameEn),
                        Text(AllahNames.names[index].meaningEn),
                      ],
                    ),
                  )
                : Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AllahNames.names[index].nameAr),
                        Text(AllahNames.names[index].nameBn),
                        Text(AllahNames.names[index].meaningBn),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
