import "package:aplikasi_kasir/pages/Transaction/components/model.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";
import "package:pdf/pdf.dart";
import "package:pdf/widgets.dart" as pw;
import "package:printing/printing.dart";

void createReceipt() async {
  Model model = Get.put(Model());

  RxList cart = model.listProduk;
  debugPrint(cart.toString());

  final font = await PdfGoogleFonts.openSansRegular();
  final image = await rootBundle.load("assets/images/iconApp_bw.png");
  final imageBytes = image.buffer.asUint8List();
  PdfPageFormat pageFormat = PdfPageFormat.roll57;

  final pdf = pw.Document();
  pdf.addPage(pw.Page(
    pageFormat: pageFormat,
    orientation: pw.PageOrientation.portrait,
    build: (pw.Context context) {
      return pw
          .Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Center(child: pw.Image(pw.MemoryImage(imageBytes), width: 30)),
        pw.SizedBox(height: 15),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text("Kasir : Aflah",
              style: pw.TextStyle(
                  font: font, fontSize: 6, fontWeight: pw.FontWeight.normal)),
          pw.Text(DateFormat.yMd().add_Hm().format(DateTime.now()),
              style: pw.TextStyle(
                  font: font, fontSize: 6, fontWeight: pw.FontWeight.normal))
        ]),
        pw.Text('Pelanggan : Rafi',
            style: pw.TextStyle(
                font: font, fontSize: 6, fontWeight: pw.FontWeight.normal)),
        pw.Container(
            width: pageFormat == PdfPageFormat.roll57 ? 570 : 800,
            child: pw.Divider(borderStyle: pw.BorderStyle.dashed)),
        for (var data in cart)
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("${data["jumlah"]}x ${data["nama"]}",
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 6,
                        fontWeight: pw.FontWeight.normal)),
                pw.Text(
                    "Rp ${NumberFormat.decimalPatternDigits(locale: "id", decimalDigits: 0).format(data["subTotal"])}",
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 6,
                        fontWeight: pw.FontWeight.normal)),
              ]),
        pw.Container(
            width: pageFormat == PdfPageFormat.roll57 ? 570 : 800,
            child: pw.Divider(borderStyle: pw.BorderStyle.dashed)),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text("Total",
              style: pw.TextStyle(
                  font: font, fontSize: 6, fontWeight: pw.FontWeight.normal)),
          pw.Text(
              "Rp ${NumberFormat.decimalPatternDigits(locale: "id", decimalDigits: 0).format(model.totalCost.value)}",
              style: pw.TextStyle(
                  font: font, fontSize: 6, fontWeight: pw.FontWeight.normal))
        ])
      ]);
    },
  ));

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
