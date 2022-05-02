import 'dart:io';
import 'package:flutter/services.dart';
import 'package:infopoverka/models/item.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfApi {
  static Future<File> generatePdfDoc(List<Items> items) async {
    const pageTheme = pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
    );
    final font = await rootBundle.load('assets/fonts/Helvetica.ttf');
    final ttf = pw.Font.ttf(font);
    final pdf = pw.Document()
      ..addPage(
        buildMultiPage(ttf, items, pageTheme),
      );

    return saveDocument(name: 'infopoverka_info.pdf', pdf: pdf);
  }

  static pw.MultiPage buildMultiPage(
    pw.Font ttf,
    List<Items> items,
    pw.PageTheme pageTheme,
  ) {
    return pw.MultiPage(
      build: (context) => [
        pw.Text(
          'Сведения о результатах поверки СИ',
          textAlign: pw.TextAlign.center,
          style: pw.TextStyle(
            font: ttf,
            fontSize: 20,
          ),
        ),
        pw.SizedBox(height: 10),
        pw.GridView(
          childAspectRatio: 0.1,
          crossAxisCount: 2,
          children: [
            pw.Container(
              alignment: pw.Alignment.centerLeft,
              color: PdfColors.blue50,
              child: pw.Text(
                'Организация - поверитель: ',
                style: pw.TextStyle(
                  font: ttf,
                  fontSize: 12,
                ),
              ),
            ),
            pw.Container(
              alignment: pw.Alignment.centerLeft,
              color: PdfColors.blue50,
              child: pw.Text(
                '${items[0].orgTitle}555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555',
                style: pw.TextStyle(
                  font: ttf,
                  fontSize: 12,
                ),
              ),
            ),
            pw.Container(
              alignment: pw.Alignment.centerLeft,
              color: PdfColors.yellow50,
              child: pw.Text(
                'Регистрационный номер типа СИ: ',
                style: pw.TextStyle(
                  font: ttf,
                  fontSize: 12,
                ),
              ),
            ),
            pw.Container(
              alignment: pw.Alignment.centerLeft,
              color: PdfColors.yellow50,
              child: pw.Text(
                '${items[0].mitNumber}555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555',
                style: pw.TextStyle(
                  font: ttf,
                  fontSize: 12,
                ),
              ),
            ),
            pw.SizedBox(height: 200),
          ],
        ),
        pw.Container(
          alignment: pw.Alignment.center,
          height: pageTheme.pageFormat.availableHeight - 650,
          child: qrCreation(stringForQrData: ''),
        ),
      ],
    );
  }

  static pw.BarcodeWidget qrCreation({required String stringForQrData}) {
    return pw.BarcodeWidget(
      color: PdfColor.fromHex('#000000'),
      barcode: pw.Barcode.qrCode(),
      data: stringForQrData,
    );
  }

  static Future<File> saveDocument({
    required String name,
    required pw.Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
