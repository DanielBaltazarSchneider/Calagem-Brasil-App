import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/data/model/liming/ResultLiming.dart';
import 'package:calagem_brasil_pro/app/modules/pdf/pdf_equilibrio_bases/pdf_equilibrio_bases_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';

class PdfEqilibrioBasesView extends StatelessWidget {
  const PdfEqilibrioBasesView({
    Key? key,
    required this.resultLiming,
    required this.soilAnalysis,
  }) : super(key: key);
  final ResultLiming resultLiming;
  final SoilAnalysis soilAnalysis;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PdfEqilibrioBasesController>(
        init: PdfEqilibrioBasesController(
          resultLiming: resultLiming,
          soilAnalysis: soilAnalysis,
        ),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Relatório"),
            ),
            body: PdfPreview(
              allowPrinting: false,
              allowSharing: true,
              canChangeOrientation: false,
              canChangePageFormat: false,
              canDebug: false,
              pdfFileName: "exemplo.pdf",
              previewPageMargin: EdgeInsets.all(5),
              build: (format) => _.generatePdf(format.portrait),
            ),
          );
        });
  }
}
