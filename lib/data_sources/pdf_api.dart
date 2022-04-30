import 'dart:io';
import 'package:flutter/services.dart';
import 'package:infopoverka/models/item.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfApi {
  static Future<File> generatePdfDoc(List<Items> items) async {
    final data = items
        .map((items) => [
              items.orgTitle,
              items.mitNumber,
              items.mitTitle,
              items.mitNotation,
              items.miModification,
              items.miNumber,
              items.verificationDate,
              items.validDate,
              items.resultDocnum,
              items.applicability.toString(),
            ])
        .toList();
    const pageTheme = pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
    );
    final font = await rootBundle.load('assets/fonts/Helvetica.ttf');
    final ttf = pw.Font.ttf(font);
    final pdf = pw.Document()
      ..addPage(
        pw.MultiPage(
          build: (context) => [
            pw.Text(
              'Заголовок',
              style: pw.TextStyle(font: ttf, fontSize: 20),
            ),
            pw.Table.fromTextArray(
              headerStyle: pw.TextStyle(font: ttf, fontSize: 12),
              cellStyle: pw.TextStyle(font: ttf, fontSize: 12),
              headers: <String>[
                'заг 1',
                'заг 1',
                'заг 1',
                'заг 1',
                'заг 1',
                'заг 1',
                'заг 1',
                'заг 1',
                'заг 1',
                'заг 1',
              ],
              data: data,
            ),
            pw.Container(
              height: pageTheme.pageFormat.availableHeight - 650,
              child: qrCreation(stringForQrData: ''),
            ),
          ],
        ),
      );

    return saveDocument(name: 'infopoverka_info.pdf', pdf: pdf);
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
