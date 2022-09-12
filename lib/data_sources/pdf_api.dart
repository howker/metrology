import 'dart:io';
import 'package:flutter/services.dart';
import 'package:infopoverka/models/item.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

//TODO при сохранении pdf имя файла = номер прибора

class PdfApi {
  static Future<File> generatePdfDoc(List<Items> items) async {
    const pageTheme = pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(20),
    );

    final font = await rootBundle.load('assets/fonts/Helvetica.ttf');
    final ttf = pw.Font.ttf(font);
    var applicability = '';

    final qrAppImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/QR_AppGallery.png'))
          .buffer
          .asUint8List(),
    );
    final appGalLogo = pw.MemoryImage(
      (await rootBundle.load('assets/images/appGalLogo.png'))
          .buffer
          .asUint8List(),
    );

    final pdf = pw.Document()
      ..addPage(
        pw.Page(
          pageTheme: pageTheme,
          build: (context) {
            if (items[0].applicability != null) {
              items[0].applicability!
                  ? applicability = 'Да'
                  : applicability = 'Нет';
            }
            return pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: [
                pw.Text(
                  'Проверить сведения -отсканировать QR код с помощью ПО "Инфо-поверка"',
                  style: pw.TextStyle(
                    font: ttf,
                    fontSize: 12,
                  ),
                ),
                pw.SizedBox(height: 10),
                pw.Container(
                  alignment: pw.Alignment.center,
                  height: pageTheme.pageFormat.availableHeight - 650,
                  child: qrCreation(stringForQrData: items[0].vriId ?? ''),
                ),
                pw.Divider(),
                pw.Spacer(),
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
                  mainAxisSpacing: 2,
                  childAspectRatio: 0.2,
                  crossAxisCount: 2,
                  children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
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
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.blue50,
                      child: pw.Text(
                        items[0].orgTitle ?? '-',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                        textScaleFactor: 0.82,
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
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
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.yellow50,
                      child: pw.Text(
                        items[0].mitNumber ?? '-',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.blue50,
                      child: pw.Text(
                        'Наименование типа СИ: ',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.blue50,
                      child: pw.Text(
                        items[0].mitTitle ?? '-',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.yellow50,
                      child: pw.Text(
                        'Обозначение типа СИ: ',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.yellow50,
                      child: pw.Text(
                        items[0].mitNotation ?? '-',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.blue50,
                      child: pw.Text(
                        'Модификация СИ: ',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.blue50,
                      child: pw.Text(
                        items[0].miModification ?? '-',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.yellow50,
                      child: pw.Text(
                        'Заводской/серийный номер/\nбуквенно-цифровое обозначение: ',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.yellow50,
                      child: pw.Text(
                        items[0].miNumber ?? '-',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.blue50,
                      child: pw.Text(
                        'Дата поверки: ',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.blue50,
                      child: pw.Text(
                        items[0].verificationDate ?? '-',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.yellow50,
                      child: pw.Text(
                        'Действительна до: ',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.yellow50,
                      child: pw.Text(
                        items[0].validDate ?? '-',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.blue50,
                      child: pw.Text(
                        'Номер свидетельства/\nизвещения/выписки: ',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.blue50,
                      child: pw.Text(
                        items[0].resultDocnum ?? '-',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.yellow50,
                      child: pw.Text(
                        'СИ пригодно: ',
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 10),
                      alignment: pw.Alignment.centerLeft,
                      color: PdfColors.yellow50,
                      child: pw.Text(
                        applicability,
                        style: pw.TextStyle(
                          font: ttf,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                pw.Spacer(),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(
                          'Подготовлено с помощью ПО "Инфо-поверка".',
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Container(
                          width: 100,
                          height: 50,
                          child: pw.Image(appGalLogo),
                        ),
                      ],
                    ),
                    pw.Container(
                      width: 80,
                      height: 80,
                      child: pw.Image(qrAppImage),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    if (items.length > 1) {
      for (var i = 1; i < items.length; i++) {
        pdf.addPage(
          pw.Page(
            build: (context) {
              if (items[i].applicability != null) {
                items[i].applicability!
                    ? applicability = 'Да'
                    : applicability = 'Нет';
              }
              return pw.Column(
                children: [
                  pw.Text(
                    'Проверить сведения -отсканировать QR код с помощью ПО "Инфо-поверка"',
                    style: pw.TextStyle(
                      font: ttf,
                      fontSize: 12,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    height: pageTheme.pageFormat.availableHeight - 650,
                    child: qrCreation(stringForQrData: items[i].vriId ?? ''),
                  ),
                  pw.Divider(),
                  pw.Spacer(),
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
                    mainAxisSpacing: 2,
                    childAspectRatio: 0.2,
                    crossAxisCount: 2,
                    children: [
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
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
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.blue50,
                        child: pw.Text(
                          items[i].orgTitle ?? '-',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
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
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.yellow50,
                        child: pw.Text(
                          items[i].mitNumber ?? '-',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.blue50,
                        child: pw.Text(
                          'Наименование типа СИ: ',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.blue50,
                        child: pw.Text(
                          items[i].mitTitle ?? '-',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.yellow50,
                        child: pw.Text(
                          'Обозначение типа СИ: ',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.yellow50,
                        child: pw.Text(
                          items[i].mitNotation ?? '-',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.blue50,
                        child: pw.Text(
                          'Модификация СИ: ',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.blue50,
                        child: pw.Text(
                          items[i].miModification ?? '-',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.yellow50,
                        child: pw.Text(
                          'Заводской/серийный номер/\nбуквенно-цифровое обозначение: ',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.yellow50,
                        child: pw.Text(
                          items[i].miNumber ?? '-',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.blue50,
                        child: pw.Text(
                          'Дата поверки: ',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.blue50,
                        child: pw.Text(
                          items[i].verificationDate ?? '-',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.yellow50,
                        child: pw.Text(
                          'Действительна до: ',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.yellow50,
                        child: pw.Text(
                          items[i].validDate ?? '-',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.blue50,
                        child: pw.Text(
                          'Номер свидетельства/\nизвещения/выписки: ',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.blue50,
                        child: pw.Text(
                          items[i].resultDocnum ?? '-',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.yellow50,
                        child: pw.Text(
                          'СИ пригодно: ',
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.only(left: 10),
                        alignment: pw.Alignment.centerLeft,
                        color: PdfColors.yellow50,
                        child: pw.Text(
                          applicability,
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  pw.Spacer(),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Text(
                            'Подготовлено с помощью ПО "Инфо-поверка".',
                            textAlign: pw.TextAlign.right,
                            style: pw.TextStyle(
                              font: ttf,
                              fontSize: 12,
                            ),
                          ),
                          pw.SizedBox(height: 5),
                          pw.Container(
                            width: 100,
                            height: 50,
                            child: pw.Image(appGalLogo),
                          ),
                        ],
                      ),
                      pw.Container(
                        width: 80,
                        height: 80,
                        child: pw.Image(qrAppImage),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      }
    }

    return saveDocument(name: items.first.miNumber.toString(), pdf: pdf);
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
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$name.pdf');

    await file.writeAsBytes(await pdf.save());

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
