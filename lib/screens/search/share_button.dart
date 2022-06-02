import 'package:flutter/material.dart';
import 'package:infopoverka/data_sources/pdf_api.dart';
import 'package:infopoverka/providers/select_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedList = context.watch<SelectProvider>().selectedList;
    return FloatingActionButton(
      backgroundColor: Colors.green,
      child: const Icon(Icons.share),
      onPressed: () async {
        final pdfFile = await PdfApi.generatePdfDoc(selectedList.toList());
        await Share.shareFiles(
          [pdfFile.path],
          text: 'Сведения о поверке от "Инфоповерки"',
        );
        //await PdfApi.openFile(pdfFile); //TODO(me): убрать после тестирования
      },
    );
  }
}
