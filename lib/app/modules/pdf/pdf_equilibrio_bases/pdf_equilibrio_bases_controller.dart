import 'dart:math';
import 'dart:typed_data';

import 'package:calagem_brasil_pro/app/app_controller.dart';
import 'package:calagem_brasil_pro/app/data/extensions/app_double.dart';
import 'package:calagem_brasil_pro/app/data/functions/Liming.dart';
import 'package:calagem_brasil_pro/app/data/functions/MyDateFormat.dart';
import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/data/model/liming/ResultLiming.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

const PdfColor grey = PdfColor.fromInt(0xff808080);
const PdfColor white = PdfColor.fromInt(0xffffffff);

const PdfColor primaryColor = PdfColor.fromInt(0xff334257);
const PdfColor secondaryColor = PdfColor.fromInt(0xff476072);
const PdfColor tertiaryColor = PdfColor.fromInt(0xff548CA8);
const PdfColor quaternaryColor = PdfColor.fromInt(0xffEEEEEE);
const sep = 120.0;

class PdfEqilibrioBasesController extends GetxController {
  PdfEqilibrioBasesController({
    required this.resultLiming,
    required this.soilAnalysis,
  });

  final ResultLiming resultLiming;
  final SoilAnalysis soilAnalysis;

  String formatTelefone(String fone) {
    List n = fone.split('');
    try {
      if (n.first == '0') {
        return "(${n[1]}${n[2]}) ${n[3]}${n[4]}${n[5]}${n[6]}${n[7]} ${n[8]}${n[9]}${n[10]}${n[11]}";
      } else {
        return "(${n[0]}${n[1]}) ${n[2]}${n[3]}${n[4]}${n[5]}${n[6]} ${n[7]}${n[8]}${n[9]}${n[10]}";
      }
    } catch (e) {
      return fone;
    }
  }

  Future<Uint8List> generatePdf(PdfPageFormat format) async {
    String title = "Recomendação de calagem";
    final doc = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    //final font = await PdfGoogleFonts.nunitoExtraLight();
    final pageTheme = await _myPageTheme(format);

    final profileImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/logo_calagem.png')).buffer.asUint8List(),
    );

    doc.addPage(
      pw.MultiPage(
        pageTheme: pageTheme,
        build: (pw.Context context) => [
          pw.Partitions(
            children: [
              pw.Partition(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: <pw.Widget>[
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                          padding: const pw.EdgeInsets.only(left: 0, bottom: 5),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: <pw.Widget>[
                              pw.Text('Recomendação de calagem',
                                  textScaleFactor: 1.6, style: pw.Theme.of(context).defaultTextStyle.copyWith(fontWeight: pw.FontWeight.bold)),
                              pw.Padding(padding: const pw.EdgeInsets.only(top: 0)),
                              pw.Text(
                                'Calagem Brasil PRO',
                                textScaleFactor: 1,
                                style: pw.Theme.of(context).defaultTextStyle.copyWith(fontWeight: pw.FontWeight.bold, color: primaryColor),
                              ),
                              pw.SizedBox(height: 10),
                              pw.Text(
                                '${AppController.to.user.nome}',
                                textScaleFactor: 1,
                                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: primaryColor, decoration: pw.TextDecoration.underline),
                              ),
                              pw.Text(
                                '${formatTelefone(AppController.to.user.telefone)}',
                                textScaleFactor: 1,
                                style: pw.Theme.of(context).defaultTextStyle.copyWith(fontWeight: pw.FontWeight.bold, color: primaryColor),
                              ),
                              pw.Padding(padding: const pw.EdgeInsets.only(top: 20)),
                              pw.Row(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                                children: <pw.Widget>[
                                  pw.Row(children: [
                                    pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: <pw.Widget>[
                                        pw.Text('Cliente:'),
                                        pw.Text('Local:'),
                                        pw.Text('Área total:'),
                                      ],
                                    ),
                                    pw.SizedBox(width: 35),
                                    pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: <pw.Widget>[
                                        pw.Text('${soilAnalysis.cliente}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                                        pw.Text('${soilAnalysis.local}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                                        pw.Text('${soilAnalysis.area.format_2()} ha', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                                      ],
                                    ),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        ),
                        pw.ClipOval(
                          child: pw.Container(
                            width: 150,
                            height: 130,
                            color: white,
                            child: pw.Image(profileImage, fit: pw.BoxFit.fitWidth),
                          ),
                        ),
                      ],
                    ),
                    _Category(title: '1. Recomendação'),
                    _Recommendation(resultLiming: resultLiming),
                    _Category(title: '2. Dados da análise de solo'),
                    _Table1(title: 'Tour bus driver', analysis: soilAnalysis),
                    _Category(title: '3. Comparação antes e após a calagem'),
                    _Table2(title: 'Tour bus driver', analysis: soilAnalysis, resultLiming: resultLiming),
                    // _Block(title: 'Tour bus driver', icon: const pw.IconData(0xe531)),
                    // _Block(title: 'Logging equipment operator', icon: const pw.IconData(0xe30d)),
                    // _Block(title: 'Foot doctor', icon: const pw.IconData(0xe3f3)),
                    // _Block(title: 'Unicorn trainer', icon: const pw.IconData(0xf0cf)),
                    // _Block(title: 'Chief chatter', icon: const pw.IconData(0xe0ca)),
                  ],
                ),
              ),
              // pw.Partition(
              //   width: sep,
              //   child: pw.Column(
              //     children: [
              //       pw.Container(
              //         height: pageTheme.pageFormat.availableHeight,
              //         child: pw.Column(
              //           crossAxisAlignment: pw.CrossAxisAlignment.center,
              //           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              //           children: <pw.Widget>[
              //             pw.ClipOval(
              //               child: pw.Container(
              //                 width: 100,
              //                 height: 100,
              //                 color: grey,
              //                 child: pw.Image(profileImage),
              //               ),
              //             ),
              //             pw.Column(children: <pw.Widget>[
              //               _Percent(size: 60, value: .7, title: pw.Text('Word')),
              //               _Percent(size: 60, value: .4, title: pw.Text('Excel')),
              //             ]),
              //             pw.Container(),
              //             // pw.BarcodeWidget(
              //             //   data: 'Parnella Charlesbois',
              //             //   width: 60,
              //             //   height: 60,
              //             //   barcode: pw.Barcode.qrCode(),
              //             //   drawText: false,
              //             // ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ],
      ),
    );

    return doc.save();
  }

  Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
    final bgShape = await rootBundle.loadString('assets/images/resume.svg');

    format = format.applyMargin(left: 2.0 * PdfPageFormat.cm, top: 3.0 * PdfPageFormat.cm, right: 2.0 * PdfPageFormat.cm, bottom: 2.0 * PdfPageFormat.cm);

    // final font1 = await rootBundle.load("assets/fonts/OpenSans-Regular.ttf");
    final font1 = await rootBundle.load("assets/fonts/CourierPrime-Regular.ttf");
    final ttfNormal1 = Font.ttf(font1);

    // final font2 = await rootBundle.load("assets/fonts/Nunito-Bold.ttf");
    final font2 = await rootBundle.load("assets/fonts/CourierPrime-Bold.ttf");
    final ttfNormal2 = Font.ttf(font2);

    return pw.PageTheme(
      pageFormat: format,
      theme: pw.ThemeData.withFont(
        base: ttfNormal1,
        // base: await PdfGoogleFonts.openSansRegular(),
        bold: ttfNormal2,
        // bold: await PdfGoogleFonts.openSansBold(),
        // icons: await PdfGoogleFonts.materialIcons(),
      ),
      buildBackground: (pw.Context context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Stack(
            children: [
              pw.Positioned(
                child: pw.SvgImage(svg: bgShape),
                left: 0,
                top: 0,
              ),
              pw.Positioned(
                child: pw.Transform.rotate(angle: pi, child: pw.SvgImage(svg: bgShape)),
                right: 0,
                bottom: 0,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Recommendation extends pw.StatelessWidget {
  _Recommendation({
    required this.resultLiming,
  });

  final ResultLiming resultLiming;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: <pw.Widget>[
        pw.Container(
          padding: pw.EdgeInsets.all(2.5),
          color: tertiaryColor,
          child: pw.Row(
            children: <pw.Widget>[
              pw.Expanded(
                  flex: 1,
                  child: pw.Text("Método de cálculo de calagem: ${resultLiming.method}", style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold))),
            ],
          ),
        ),
        pw.Row(children: [pw.Flexible(flex: 1, child: pw.Container(height: 1, color: quaternaryColor))]),
        pw.Container(
          padding: pw.EdgeInsets.all(2.5),
          color: tertiaryColor,
          child: pw.Row(
            children: <pw.Widget>[
              pw.Expanded(
                  flex: 1,
                  child: pw.Center(child: pw.Text('Calcário Calcítico', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold, fontSize: 11)))),
              pw.Expanded(
                  flex: 1,
                  child: pw.Center(child: pw.Text('Calcário Dolomítico', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold, fontSize: 11)))),
              pw.Expanded(
                  flex: 1,
                  child: pw.Center(child: pw.Text('Cloreto de Potássio', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold, fontSize: 11)))),
            ],
          ),
        ),
        pw.Row(
          children: [
            pw.Expanded(
              flex: 1,
              child: pw.Center(
                child: pw.Text(
                  '${(resultLiming.calciteLimestone! > 0 ? resultLiming.calciteLimestone! : 0.0).format_0()} kg/ha',
                  style: pw.TextStyle(color: primaryColor, fontWeight: pw.FontWeight.bold, fontSize: 13),
                ),
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Center(
                child: pw.Text(
                  '${(resultLiming.dolomiticLimestone! > 0 ? resultLiming.dolomiticLimestone! : 0.0).format_0()} kg/ha',
                  style: pw.TextStyle(color: primaryColor, fontWeight: pw.FontWeight.bold, fontSize: 13),
                ),
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Center(
                child: pw.Text(
                  '${(resultLiming.potassiumFertilization! > 0 ? resultLiming.potassiumFertilization! : 0.0).format_0()} kg/ha',
                  style: pw.TextStyle(color: primaryColor, fontWeight: pw.FontWeight.bold, fontSize: 13),
                ),
              ),
            ),
          ],
        ),
        pw.Row(children: [pw.Flexible(flex: 1, child: pw.Container(height: 1, color: tertiaryColor))]),
        pw.Text("Cálculado em ${MyDateFormat.format_dd_MM_yyyy(resultLiming.dateCalculation.toString())}", style: pw.TextStyle(fontSize: 10)),
        pw.SizedBox(height: 15),
      ],
    );
  }
}

class _Table1 extends pw.StatelessWidget {
  _Table1({
    required this.title,
    required this.analysis,
  });

  final String title;
  final SoilAnalysis analysis;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: <pw.Widget>[
        pw.Container(
          padding: pw.EdgeInsets.all(2.5),
          color: tertiaryColor,
          child: pw.Row(
            children: <pw.Widget>[
              pw.Expanded(flex: 1, child: pw.Center(child: pw.Text('Ca', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold)))),
              pw.Expanded(flex: 1, child: pw.Center(child: pw.Text('Mg', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold)))),
              pw.Expanded(flex: 1, child: pw.Center(child: pw.Text('K', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold)))),
              pw.Expanded(flex: 1, child: pw.Center(child: pw.Text('Na', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold)))),
              pw.Expanded(flex: 1, child: pw.Center(child: pw.Text('H+Al', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold)))),
              pw.Expanded(flex: 1, child: pw.Center(child: pw.Text('Al', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold)))),
              pw.Expanded(flex: 1, child: pw.Center(child: pw.Text('pH', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold)))),
            ],
          ),
        ),
        pw.Row(children: [pw.Flexible(flex: 1, child: pw.Container(height: 0.7, color: white))]),
        pw.Container(
          padding: pw.EdgeInsets.all(2.5),
          color: tertiaryColor,
          child: pw.Row(
            children: <pw.Widget>[
              pw.Expanded(flex: 1, child: pw.Center(child: pw.Text('cmolc/dm³', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold)))),
            ],
          ),
        ),
        pw.Container(
          padding: pw.EdgeInsets.all(2.5),
          color: white,
          child: pw.Row(
            children: <pw.Widget>[
              pw.Expanded(
                flex: 1,
                child: pw.Center(
                  child: pw.Text(
                    '${analysis.ca.format_2()}',
                    style: pw.TextStyle(
                      color: primaryColor,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Center(
                  child: pw.Text(
                    '${analysis.mg.format_2()}',
                    style: pw.TextStyle(
                      color: primaryColor,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Center(
                  child: pw.Text(
                    '${analysis.k.format_2()}',
                    style: pw.TextStyle(
                      color: primaryColor,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Center(
                  child: pw.Text(
                    '${analysis.na.format_2()}',
                    style: pw.TextStyle(
                      color: primaryColor,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Center(
                  child: pw.Text(
                    '${analysis.hAl.format_2()}',
                    style: pw.TextStyle(
                      color: primaryColor,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Center(
                  child: pw.Text(
                    '${analysis.al.format_2()}',
                    style: pw.TextStyle(
                      color: primaryColor,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Center(
                  child: pw.Text(
                    '${analysis.pH.format_2()}',
                    style: pw.TextStyle(
                      color: primaryColor,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        pw.Row(children: [pw.Flexible(flex: 1, child: pw.Container(height: 1, color: tertiaryColor))]),
        pw.SizedBox(height: 15),
      ],
    );
  }
}

class _Table2 extends pw.StatelessWidget {
  _Table2({
    required this.title,
    required this.analysis,
    required this.resultLiming,
  });

  final String title;
  final SoilAnalysis analysis;
  final ResultLiming resultLiming;

  @override
  pw.Widget build(pw.Context context) {
    final double ctc = analysis.hAl + analysis.ca + analysis.mg + analysis.k;
    final double currentV = (analysis.ca + analysis.mg + analysis.k) * 100 / ctc;

    LimestoneParticipation finalParticipation = Liming.limestoneParticipation(liming: resultLiming);
    final double partCa = (analysis.ca * 100) / ctc;
    final double partMg = (analysis.mg * 100) / ctc;
    final double partK = (analysis.k * 100) / ctc;

    final double finalCtc =
        analysis.ca + analysis.mg + analysis.k + analysis.al + analysis.na + finalParticipation.ca + finalParticipation.mg + finalParticipation.k;

    final double finalPartCa = ((analysis.ca + finalParticipation.ca) * 100) / finalCtc;
    final double finalPartMg = ((analysis.mg + finalParticipation.mg) * 100) / finalCtc;
    final double finaPartK = ((analysis.k + finalParticipation.k) * 100) / finalCtc;
    final double finalV =
        (((analysis.ca + finalParticipation.ca) + (analysis.mg + finalParticipation.mg) + (analysis.k + finalParticipation.k)) * 100) / finalCtc;

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: <pw.Widget>[
        pw.Container(
          padding: pw.EdgeInsets.all(2.5),
          color: tertiaryColor,
          child: pw.Row(
            children: <pw.Widget>[
              pw.Expanded(flex: 1, child: pw.Center(child: pw.Text('', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold)))),
              pw.Expanded(flex: 1, child: pw.Center(child: pw.Text('Atual (%)', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold)))),
              pw.Expanded(flex: 1, child: pw.Center(child: pw.Text('Após (%)', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold)))),
              pw.Expanded(flex: 1, child: pw.Center(child: pw.Text('Ganho (%)', style: pw.TextStyle(color: white, fontWeight: pw.FontWeight.bold)))),
            ],
          ),
        ),
        pw.Row(children: [pw.Flexible(flex: 1, child: pw.Container(height: 0.7, color: white))]),
        pw.Container(
          color: white,
          child: pw.Row(
            children: <pw.Widget>[
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: tertiaryColor,
                  child: pw.Center(
                    child: pw.Text(
                      'V',
                      style: pw.TextStyle(
                        color: white,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: white,
                  child: pw.Center(
                    child: pw.Text(
                      '${currentV.format_2()}',
                      style: pw.TextStyle(
                        color: primaryColor,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: white,
                  child: pw.Center(
                    child: pw.Text(
                      '${(resultLiming.elevaCa! + resultLiming.elevaMg! + resultLiming.elevaK!).format_2()}',
                      style: pw.TextStyle(
                        color: primaryColor,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: white,
                  child: pw.Center(
                    child: pw.Text(
                      '${(finalV - currentV).format_2()}',
                      style: pw.TextStyle(
                        color: primaryColor,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        pw.Row(children: [pw.Flexible(flex: 1, child: pw.Container(height: 0.7, color: quaternaryColor))]),
        pw.Container(
          color: white,
          child: pw.Row(
            children: <pw.Widget>[
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: tertiaryColor,
                  child: pw.Center(
                    child: pw.Text(
                      'Ca',
                      style: pw.TextStyle(
                        color: white,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: white,
                  child: pw.Center(
                    child: pw.Text(
                      '${partCa.format_2()}',
                      style: pw.TextStyle(
                        color: primaryColor,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: white,
                  child: pw.Center(
                    child: pw.Text(
                      '${resultLiming.elevaCa!.format_2()}',
                      style: pw.TextStyle(
                        color: primaryColor,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: white,
                  child: pw.Center(
                    child: pw.Text(
                      '${(resultLiming.elevaCa! - partCa).format_2()}',
                      style: pw.TextStyle(
                        color: primaryColor,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        pw.Row(children: [pw.Flexible(flex: 1, child: pw.Container(height: 0.7, color: quaternaryColor))]),
        pw.Container(
          color: white,
          child: pw.Row(
            children: <pw.Widget>[
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: tertiaryColor,
                  child: pw.Center(
                    child: pw.Text(
                      'Mg',
                      style: pw.TextStyle(
                        color: white,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: white,
                  child: pw.Center(
                    child: pw.Text(
                      '${partMg.format_2()}',
                      style: pw.TextStyle(
                        color: primaryColor,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: white,
                  child: pw.Center(
                    child: pw.Text(
                      '${resultLiming.elevaMg!.format_2()}',
                      style: pw.TextStyle(
                        color: primaryColor,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: white,
                  child: pw.Center(
                    child: pw.Text(
                      '${(resultLiming.elevaMg! - partMg).format_2()}',
                      style: pw.TextStyle(
                        color: primaryColor,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        pw.Row(children: [pw.Flexible(flex: 1, child: pw.Container(height: 0.7, color: quaternaryColor))]),
        pw.Container(
          color: white,
          child: pw.Row(
            children: <pw.Widget>[
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: tertiaryColor,
                  child: pw.Center(
                    child: pw.Text(
                      'K',
                      style: pw.TextStyle(
                        color: white,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: white,
                  child: pw.Center(
                    child: pw.Text(
                      '${partK.format_2()}',
                      style: pw.TextStyle(
                        color: primaryColor,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: white,
                  child: pw.Center(
                    child: pw.Text(
                      '${(resultLiming.elevaK! > partK ? resultLiming.elevaK! : partK).format_2()}',
                      style: pw.TextStyle(
                        color: primaryColor,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  padding: pw.EdgeInsets.all(2.5),
                  color: white,
                  child: pw.Center(
                    child: pw.Text(
                      '${((resultLiming.elevaK! > partK ? resultLiming.elevaK! : partK) - partK).format_2()}',
                      style: pw.TextStyle(
                        color: primaryColor,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        pw.Row(children: [pw.Flexible(flex: 1, child: pw.Container(height: 1, color: tertiaryColor))]),
        pw.SizedBox(height: 15),
      ],
    );
  }
}

class _Block extends pw.StatelessWidget {
  _Block({
    required this.title,
    this.icon,
  });

  final String title;

  final pw.IconData? icon;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: <pw.Widget>[
      pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: <pw.Widget>[
        pw.Container(
          width: 6,
          height: 6,
          margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
          decoration: const pw.BoxDecoration(
            color: primaryColor,
            shape: pw.BoxShape.circle,
          ),
        ),
        pw.Text(title, style: pw.Theme.of(context).defaultTextStyle.copyWith(fontWeight: pw.FontWeight.bold)),
        pw.Spacer(),
        if (icon != null) pw.Icon(icon!, color: grey, size: 18),
      ]),
      pw.Container(
        decoration: const pw.BoxDecoration(border: pw.Border(left: pw.BorderSide(color: primaryColor, width: 2))),
        padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
        margin: const pw.EdgeInsets.only(left: 5),
        child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: <pw.Widget>[
          pw.Lorem(length: 20),
        ]),
      ),
    ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: white,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      padding: const pw.EdgeInsets.fromLTRB(0, 4, 20, 6),
      child: pw.Text(title, textScaleFactor: 1.1, style: pw.TextStyle(color: primaryColor, fontWeight: pw.FontWeight.bold)),
    );
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
    this.fontSize = 1.2,
    this.color = primaryColor,
    this.backgroundColor = PdfColors.grey300,
    this.strokeWidth = 5,
  });

  final double size;

  final double value;

  final pw.Widget title;

  final double fontSize;

  final PdfColor color;

  final PdfColor backgroundColor;

  final double strokeWidth;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    widgets.add(title);

    return pw.Column(children: widgets);
  }
}

class _UrlText extends pw.StatelessWidget {
  _UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}
