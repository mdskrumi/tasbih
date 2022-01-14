import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadPdf extends StatelessWidget {
  const ReadPdf({Key? key}) : super(key: key);
  static const route = '/read';

  @override
  Widget build(BuildContext context) {
    final pdfName = ModalRoute.of(context)!.settings.arguments as String;

    return SafeArea(
      child: Scaffold(
        body: SfPdfViewer.asset(
          'assets/files/$pdfName.pdf',
        ),
      ),
    );
  }
}
