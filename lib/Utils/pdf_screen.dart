import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'global_var.dart';


class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  final pdf = pw.Document();

  generatePdf() async {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.ListView.builder(itemBuilder: (context, index) => pw.Container(
            height: 80,
            width: double.infinity,
            padding: const pw.EdgeInsets.all(10),
            margin: const pw.EdgeInsets.all(10),
            decoration: pw.BoxDecoration(
                border: pw.Border.all(
                  color: PdfColors.black,
                  width: 1.5,
                )
            ),
          ), itemCount: productName.length);
        },
      ),
    );
    await Printing.layoutPdf(onLayout: (format) async => await pdf.save(),);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await generatePdf();
            },
            child: const Text("Generate PDF"),
          ),
        ),
      ),
    );
  }
}