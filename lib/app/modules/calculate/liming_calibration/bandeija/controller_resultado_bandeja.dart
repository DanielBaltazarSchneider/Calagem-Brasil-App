import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class ControllerResultBandeja extends GetxController {
  double? largura;
  double? comprimento;
  double? velocidade;
  double? dosagem;
  List<double> listPesos;

  double? dosagemAtual;
  double? diferenca;
  double? velocidadeIdeal;
  double? porcentagem;

  int _counter = 0;
  File? imageFile;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  ControllerResultBandeja({
    this.largura,
    this.comprimento,
    this.velocidade,
    this.dosagem,
    this.listPesos = const [],
  });

  @override
  void onInit() {
    super.onInit();
    calculaDosagem();
  }

  void calculaDosagem() {
    double media = (listPesos.reduce((a, b) => a + b) / listPesos.length) / 1000;
    dosagemAtual = 10000 * media / ((largura! / 100) * (comprimento! / 100));
    diferenca = dosagemAtual! - dosagem!;
    print('dosagem: ' + dosagemAtual.toString() + " kg/ha");
    velocidadeIdeal = (velocidade! * dosagemAtual!) / dosagem!;
    if (dosagemAtual! > dosagem!) {
      porcentagem = 100 - ((dosagem! * 100) / dosagemAtual!);
    } else {
      porcentagem = ((dosagem! * 100) / dosagemAtual!) - 100;
    }
  }

  void sharedScreen() async {
    screenshotController.capture(pixelRatio: 1.5).then((image) async {
      imageFile = File.fromRawPath(image!);
      update();
      _shareImage(imageFile);
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> _shareImage(imageFile) async {
    try {
      // final ByteData bytes = await rootBundle.load('assets/image1.png');
      Uint8List _bytes = await imageFile.readAsBytes();
      final ByteData bytes = await ByteData.sublistView(_bytes);
      // await Share.file(
      //   'Calagem Brasil',
      //   'Calagem Brasil_${DateTime.now()}.png',
      //   bytes.buffer.asUint8List(),
      //   'image/png',
      //   text: 'Calagem Brasil - Resultado do cálculo de distribuição por bandejas.',
      // );
    } catch (e) {
      print('error: $e');
    }
  }
}
