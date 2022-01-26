import 'package:calagem_brasil_pro/app/modules/pdf/pdf_aluminio_trocavel/pdf_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';

class PdfView extends StatelessWidget {
  const PdfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PdfController>(
        init: PdfController(),
        builder: (_) {
          return Scaffold(
            body: PdfPreview(
              allowPrinting: false,
              allowSharing: true,
              canChangeOrientation: false,
              canChangePageFormat: false,
              canDebug: false,
              pdfFileName: "exemplo.pdf",
              previewPageMargin: EdgeInsets.all(5),
              build: (format) => _.generatePdf(format),
            ),
          );
        });
  }
}
