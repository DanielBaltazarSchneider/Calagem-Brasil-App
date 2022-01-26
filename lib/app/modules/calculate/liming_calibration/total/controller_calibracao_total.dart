import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ControllerCalibracaoTotal extends GetxController {
  static ControllerCalibracaoTotal get to => Get.find();
  TextEditingController controllerDistancia = new TextEditingController();
  TextEditingController controllerTempo = new TextEditingController();
  TextEditingController controllerVelocidade = new TextEditingController();
  TextEditingController controllerDosagem = new TextEditingController();
  TextEditingController controllerFaixa = new TextEditingController();
  TextEditingController controllerPesoColeta = new TextEditingController();

  double distancia = 0;
  double tempo = 0;
  double velocidade = 0;
  double dosagem = 0;
  double faixa = 0;
  double pesoColeta = 0;

  bool exibeNormal = false;
  bool exibePelaAmostra = false;

  var f = NumberFormat('#,##0.##', 'pt_BR');

  void calculaTempoDistancia() {
    if (controllerDistancia.text != '') {
      distancia = double.parse(controllerDistancia.text.replaceAll(',', '.'));
      print('distancia: $distancia');
      update();
    }

    if (controllerTempo.text != '') {
      tempo = double.parse(controllerTempo.text.replaceAll(',', '.'));
      print('tempo: $tempo');
      update();
    }

    if (controllerVelocidade.text != '') {
      velocidade = double.parse(controllerVelocidade.text.replaceAll(',', '.'));
      print('velocidade: $velocidade');
      update();

      if ((distancia > 0 || tempo > 0) && velocidade > 0) {
        if (distancia > 0) {
          controllerTempo.text = f.format(distancia / (velocidade / 3.6));
          print('Tempo= ${distancia / velocidade}');
        } else if (tempo > 0) {
          controllerDistancia.text = f.format((velocidade / 3.6) * tempo);
          print('Distancia= ${(velocidade / 3.6) * tempo}');
        }
      } else if (distancia == 0 && tempo == 0 && velocidade > 0) {
        controllerDistancia.text = '10';
        controllerTempo.text = f.format(50 / (velocidade / 3.6));
      }
    }

    if (dosagem > 0 && faixa > 0) {
      verificaCalculo();
    }
  }

  void calculaVelocidade() {
    if (controllerDistancia.text != '') {
      distancia = double.parse(controllerDistancia.text.replaceAll(',', '.'));
      print('distancia: $distancia');
      update();
    }

    if (controllerTempo.text != '') {
      tempo = double.parse(controllerTempo.text.replaceAll(',', '.'));
      print('tempo: $tempo');
      update();
    }

    if (controllerVelocidade.text != '') {
      velocidade = double.parse(controllerVelocidade.text.replaceAll(',', '.'));
      update();
    }

    if (controllerDosagem.text != '') {
      dosagem = double.parse(controllerDosagem.text.replaceAll(',', '.'));
      update();
    }

    if (controllerFaixa.text != '') {
      faixa = double.parse(controllerFaixa.text.replaceAll(',', '.'));
    }

    if (controllerPesoColeta.text != '') {
      pesoColeta = double.parse(controllerPesoColeta.text.replaceAll(',', '.'));
      update();
    }

    if (distancia > 0 && tempo > 0) {
      velocidade = (distancia / tempo) * 3.6;
      controllerVelocidade.text = f.format((distancia / tempo) * 3.6);
      update();
    }
    verificaCalculo();
  }

  void verificaCalculo() {
    if (controllerDistancia.text != '') {
      distancia = double.parse(controllerDistancia.text.replaceAll(',', '.'));
      update();
    }

    if (controllerTempo.text != '') {
      tempo = double.parse(controllerTempo.text.replaceAll(',', '.'));
      update();
    }

    if (controllerVelocidade.text != '') {
      velocidade = double.parse(controllerVelocidade.text.replaceAll(',', '.'));
      update();
    }

    if (controllerDosagem.text != '') {
      dosagem = double.parse(controllerDosagem.text.replaceAll(',', '.'));
      update();
    }

    if (controllerFaixa.text != '') {
      faixa = double.parse(controllerFaixa.text.replaceAll(',', '.'));
    }

    if (controllerPesoColeta.text != '') {
      pesoColeta = double.parse(controllerPesoColeta.text.replaceAll(',', '.'));
      update();
    }

    if (dosagem > 0 && faixa > 0 && velocidade > 0) {
      pesoColeta = (dosagem / 10000) * (distancia * faixa);
      controllerPesoColeta.text = f.format(pesoColeta);
      update();
      print('Teste');
    } else {
      controllerPesoColeta.text = '';
    }
    exibeNormal = true;
    exibePelaAmostra = false;
    update();
  }

  void defineVelocidadeColetado() {
    distancia = 0;
    controllerDistancia.text = '';
    velocidade = 0;
    controllerVelocidade.text = '';
    update();

    if (controllerTempo.text != '') {
      tempo = double.parse(controllerTempo.text.replaceAll(',', '.'));
      update();
    }

    if (controllerDosagem.text != '') {
      dosagem = double.parse(controllerDosagem.text.replaceAll(',', '.'));
      update();
    }

    if (controllerFaixa.text != '') {
      faixa = double.parse(controllerFaixa.text.replaceAll(',', '.'));
      update();
    }

    if (controllerPesoColeta.text != '') {
      pesoColeta = double.parse(controllerPesoColeta.text.replaceAll(',', '.'));
      update();
    }
    if (dosagem > 0 && faixa > 0 && pesoColeta > 0 && tempo > 0) {
      double doseM2 = dosagem / 10000;
      double areaCoberta = pesoColeta / doseM2;
      distancia = areaCoberta / faixa;
      velocidade = distancia / tempo * 3.6;
      controllerDistancia.text = f.format(distancia);
      controllerVelocidade.text = f.format(velocidade);
      update();
    }
    exibeNormal = false;
    exibePelaAmostra = true;
    update();
  }
}
