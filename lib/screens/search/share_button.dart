import 'package:flutter/material.dart';
import 'package:infopoverka/data_sources/pdf_api.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.share),
      onPressed: () async {
        final pdfFile = await PdfApi.generateTable();
        await PdfApi.openFile(pdfFile);

        // final Route route = MaterialPageRoute<dynamic>(
        //   builder: (context) => const FilterScreen(),
        // );
        // Navigator.push<dynamic>(context, route);
      },
    );
  }
}
