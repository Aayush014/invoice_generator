import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../Utils/global_var.dart';

final pdf = pw.Document();

generatePdf() async {
  pdf.addPage(pw.Page(
    build: (context) {
      return pw.Container(
        height: double.infinity,
        width: double.infinity,
        child: pw.Column(
          children: [
            pw.Container(
              height: 30,
              width: 500,
              decoration: pw.BoxDecoration(
                  color: PdfColors.grey,
                  borderRadius: pw.BorderRadius.circular(15)),
              child: pw.Center(
                child: pw.Text(
                  "Invoice",
                  style: const pw.TextStyle(fontSize: 25),
                ),
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Container(
              height: 130,
              width: 500,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(width: 2),
                borderRadius: pw.BorderRadius.circular(15),
                color: PdfColors.white,
              ),
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.SizedBox(height: 5),
                  pw.Text("Weekend Developers",
                      style: pw.TextStyle(
                          fontSize: 30, fontWeight: pw.FontWeight.bold)),
                  pw.Center(
                    child: pw.Text(
                      "G-69 Savera Tower, Opp. Red & White",
                      style: pw.TextStyle(
                          fontSize: 20, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.Center(
                    child: pw.Text(
                      "Dindoli-Surat-394210",
                      style: pw.TextStyle(
                          fontSize: 20, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.Center(
                    child: pw.Text(
                      "Mob No:- 9879004689",
                      style: pw.TextStyle(
                          fontSize: 20, fontWeight: pw.FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Container(
              width: 500,
              height: 550,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                  width: 2,
                  color: PdfColors.black,
                ),
                borderRadius: pw.BorderRadius.circular(20),
              ),
              child: pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Column(
                  children: [
                    pw.Center(
                      child: pw.Container(
                        height: 50,
                        width: 500,
                        child: pw.Text(
                          "                       ${customerName.toString().replaceAll('[', '').replaceAll(']', '')}",
                          style: const pw.TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    pw.Container(
                      height: 200,
                      width: 450,
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(
                          width: 1.5,
                          color: PdfColors.black,
                        ),
                      ),
                      child: pw.Column(
                        children: [
                          pw.ListView.builder(
                              itemBuilder: (context, index) => pw.Container(
                                height: 20,
                                width: double.infinity,
                                padding: const pw.EdgeInsets.all(10),
                                margin: const pw.EdgeInsets.all(10),
                                child: pw.Row(
                                    mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceEvenly,
                                    children: [
                                      pw.Text(
                                        '${index + 1}',
                                        style: const pw.TextStyle(
                                            fontSize: 17),
                                      ),
                                      pw.Text(
                                        '${productName[index]}',
                                        style: const pw.TextStyle(
                                            fontSize: 17),
                                      ),
                                      pw.Text(
                                        '${productQty[index]}',
                                        style: const pw.TextStyle(
                                            fontSize: 17),
                                      ),
                                      pw.Text(
                                        '${productAmount[index]}',
                                        style: const pw.TextStyle(
                                            fontSize: 17),
                                      ),
                                    ]),
                              ),
                              itemCount: productName.length),
                          pw.Spacer(),
                          pw.Text(
                              '                                  Total     $total',
                              style: const pw.TextStyle(fontSize: 20)),
                          pw.Spacer()
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 40),
                  ],
                ),
              ),
            ),

          ],
        ),
      );
    },
    pageFormat: PdfPageFormat.a4,
  ));
  await Printing.layoutPdf(
    onLayout: (format) async => await pdf.save(),
  );
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartSCreenState();
}

class _CartSCreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0F2C59),
          leading: const Icon(Icons.storefront, size: 30),
          title: const Text("Invoice Generator"),
          actions: [
            const Icon(
              Icons.share_rounded,
              size: 30,
            ),
            const SizedBox(
              width: 30,
            ),
            InkWell(
              child: const Icon(Icons.picture_as_pdf_rounded, size: 30),
              onTap: () async {
                for (int i = 0; i < productAmount.length; i++) {
                  total = total + productAmount[i];
                }
                await generatePdf();
              },
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => productBox(index),
          itemCount: productName.length,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff0F2C59),
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('item');
          },
        ),
      ),
    );
  }
}


class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDCD6F7),
      appBar: AppBar(
        backgroundColor: const Color(0xff424874),
        leading: const Icon(
          CupertinoIcons.house_fill,
          color: CupertinoColors.white,
        ),
        title: const Text(
          "Product List",
          style: TextStyle(color: CupertinoColors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                for (int i = 0; i < productAmount.length; i++) {
                  total = total + productAmount[i];
                }
                await generatePdf();
              },
              icon: const Icon(
                Icons.contact_page,
                color: CupertinoColors.white,
                size: 30,
              ))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => productBox(index),
        itemCount: productName.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff424874),
        child: const Icon(
          CupertinoIcons.add,
          color: CupertinoColors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

Widget productBox(int index) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 3,
            color: const Color(0xff424874),
          )),
      alignment: Alignment.center,
      height: 80,
      width: double.infinity,
      child: ListTile(
        leading: const CircleAvatar(
          radius: 35,
          backgroundColor: Color(0xff424874),
        ),
        title: Text(
          '${productName[index]}',
          style: const TextStyle(fontSize: 18),
        ),
        subtitle: Text(
          '${productQty[index]} Qty',
          style: const TextStyle(fontSize: 18),
        ),
        trailing: Text(
          '${productAmount[index]}/-',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    ),
  );
}
