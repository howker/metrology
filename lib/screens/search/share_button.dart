import 'package:flutter/material.dart';
import 'package:infopoverka/data_sources/pdf_api.dart';
import 'package:infopoverka/providers/select_provider.dart';
import 'package:provider/provider.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedList = context.watch<SelectProvider>().selectedList;
    return FloatingActionButton(
      child: const Icon(Icons.share),
      onPressed: () async {
        PdfApi.qrCreation(stringForQrData: 'stringForQrData');
        final pdfFile = await PdfApi.generatePdfDoc(selectedList);
        await PdfApi.openFile(pdfFile);
      },
    );
  }
}
