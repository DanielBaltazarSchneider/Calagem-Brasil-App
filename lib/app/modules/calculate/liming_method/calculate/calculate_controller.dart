import 'dart:convert';

import 'package:calagem_brasil_pro/app/app_controller.dart';
import 'package:calagem_brasil_pro/app/data/extensions/app_double.dart';
import 'package:calagem_brasil_pro/app/data/functions/Liming.dart';
import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/data/model/config/DefaultConfig.dart';
import 'package:calagem_brasil_pro/app/data/model/liming/ResultLiming.dart';
import 'package:calagem_brasil_pro/app/modules/calculate/liming_method/result/result_view.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CalculateController extends GetxController {
  final SoilAnalysis soilAnalysis;
  final String method;
  final storage = GetStorage();

  TextEditingController controllerCa = TextEditingController();
  TextEditingController controllerMg = TextEditingController();
  TextEditingController controllerK = TextEditingController();
  TextEditingController controllerPRNTcalcite = TextEditingController();
  TextEditingController controllerPRNTdolomitic = TextEditingController();
  TextEditingController controllerVpercent = TextEditingController();
  TextEditingController controllerCalCaO = TextEditingController();
  TextEditingController controllerCalMgO = TextEditingController();
  TextEditingController controllerDolCaO = TextEditingController();
  TextEditingController controllerDolMgO = TextEditingController();

  CalculateController(this.soilAnalysis, this.method) {
    returnStorageConfigValues();
    refreshParticipation();
  }

  bool pH55 = true;
  bool pH6 = false;
  bool pH65 = false;

  bool soil1 = false;
  bool soil2 = true;
  bool soil3 = false;

  ResultLiming resultLiming = ResultLiming();
  String relationSoil = "0,0";
  String relationCal = "0,0";

  returnStorageConfigValues() {
    try {
      String jsonConfig = storage.read('defaultConfig_${AppController.to.user.uuidUsuario}');
      DefaultConfig defaultConfig = DefaultConfig.fromJson(jsonDecode(jsonConfig));
      controllerCa.text = defaultConfig.ca.toString();
      controllerMg.text = defaultConfig.mg.toString();
      controllerK.text = defaultConfig.k ?? "4";
      controllerPRNTcalcite.text = defaultConfig.prntCalcite.toString();
      controllerPRNTdolomitic.text = defaultConfig.prntDolomitic.toString();
      controllerVpercent.text = defaultConfig.vPercent.toString();
      controllerCalCaO.text = defaultConfig.calCaO.toString();
      controllerCalMgO.text = defaultConfig.calMgO.toString();
      controllerDolCaO.text = defaultConfig.dolCaO.toString();
      controllerDolMgO.text = defaultConfig.dolMgO.toString();
      update();
    } catch (err) {
      print('Não definidos: $err');
      controllerCa.text = '55';
      controllerMg.text = '15';
      controllerK.text = '4';
      controllerPRNTcalcite.text = '95';
      controllerPRNTdolomitic.text = '95';
      controllerVpercent.text = '70';
      controllerCalCaO.text = '40';
      controllerCalMgO.text = '4';
      controllerDolCaO.text = '30';
      controllerDolMgO.text = '22';
    }
  }

  void calculate() {
    switch (method) {
      case 'estequiometrico':
        resultLiming = Liming().stoichiometric(
          soilAnalysis: soilAnalysis,
          prntCalcite: double.parse(controllerPRNTcalcite.text),
          prntDolomitic: double.parse(controllerPRNTdolomitic.text),
          calcao: double.parse(controllerCalCaO.text),
          calmgo: double.parse(controllerCalMgO.text),
          dolcao: double.parse(controllerDolCaO.text),
          dolmgo: double.parse(controllerDolMgO.text),
          elevaCa: double.parse(controllerCa.text),
          elevaMg: double.parse(controllerMg.text),
          elevaK: double.parse(controllerK.text),
        );
        break;
      case 'estequiometrico2':
        resultLiming = Liming().stoichiometric2(
          soilAnalysis: soilAnalysis,
          prntCalcite: double.parse(controllerPRNTcalcite.text),
          prntDolomitic: double.parse(controllerPRNTdolomitic.text),
          calcao: double.parse(controllerCalCaO.text),
          calmgo: double.parse(controllerCalMgO.text),
          dolcao: double.parse(controllerDolCaO.text),
          dolmgo: double.parse(controllerDolMgO.text),
          elevaCa: double.parse(controllerCa.text),
          elevaMg: double.parse(controllerMg.text),
          elevaK: double.parse(controllerK.text),
        );
        break;
      case "saturacao_bases":
        resultLiming = Liming().sumOfBases(
          soilAnalysis: soilAnalysis,
          prntCalcite: double.parse(controllerPRNTcalcite.text),
          prntDolomitic: double.parse(controllerMg.text),
        );
        break;
      case "smp":
        resultLiming = Liming().smp(
          soilAnalysis: soilAnalysis,
          desiredPH: double.parse(phSelected().toStringAsPrecision(2)),
          prntCalcite: double.parse(controllerPRNTcalcite.text),
          prntDolomitic: double.parse(controllerMg.text),
        );
        break;
      case "aluminio_trocavel":
        resultLiming = Liming().exchangeableAluminum(
          soilAnalysis: soilAnalysis,
          soilType: soilSelected(),
          prntCalcite: double.parse(controllerPRNTcalcite.text),
          prntDolomitic: double.parse(controllerMg.text),
        );
        break;
      default:
        Get.snackbar("Ocorreu um erro", "Tente novamente mais tarde", backgroundColor: AppColors.primary, colorText: Colors.white);
    }
    Get.to(() => ResultView(
          resultLiming: resultLiming,
          soilAnalysis: soilAnalysis,
        ));
    // print("Calcitico: " + resultLiming.calciteLimestone.toString());
    // print("Dolomitico: " + resultLiming.dolomiticLimestone.toString());
  }

  String curentMethod(_method) {
    switch (_method) {
      case "estequiometrico":
        return "Ajuste estequiométrico";
      case "estequiometrico2":
        return "Equilibrio das bases (Albrecht)";
      case "saturacao_bases":
        return "Saturação de bases";
      case "smp":
        return "Índice SMP";
      case "aluminio_trocavel":
        return "Alumínio trocável";
      default:
        return "Erro";
    }
  }

  String relationSoilAnalysis() {
    try {
      double _ca = double.parse(soilAnalysis.ca.toString());
      double _mg = double.parse(soilAnalysis.mg.toString());
      return "${_ca / _mg}";
    } catch (err) {
      return "0.0";
    }
  }

  String relationCalculus() {
    try {
      double _ca = double.parse(controllerCa.text);
      double _mg = double.parse(controllerMg.text);
      return "${_ca / _mg}";
    } catch (err) {
      return "0.0";
    }
  }

  void refreshParticipation() {
    relationSoil = double.parse(relationSoilAnalysis()).format_2();
    relationCal = double.parse(relationCalculus()).format_2();
    update();
  }

  setpH({String? faixa = '5,5'}) {
    if (faixa == "5,5") {
      pH55 = true;
      pH6 = false;
      pH65 = false;
      update();
    } else if (faixa == "6") {
      pH55 = false;
      pH6 = true;
      pH65 = false;
      update();
    } else if (faixa == "6,5") {
      pH55 = false;
      pH6 = false;
      pH65 = true;
      update();
    }
  }

  setTypeSoil({required String soil}) {
    if (soil == "1") {
      soil1 = true;
      soil2 = false;
      soil3 = false;
      update();
    } else if (soil == "2") {
      soil1 = false;
      soil2 = true;
      soil3 = false;
      update();
    } else if (soil == "3") {
      soil1 = false;
      soil2 = false;
      soil3 = true;
      update();
    }
  }

  double phSelected() {
    if (pH55) {
      return 5.5;
    } else if (pH6) {
      return 6.0;
    } else if (pH65) {
      return 6.5;
    } else {
      return 7.1;
    }
  }

  String soilSelected() {
    if (soil1) {
      return "1";
    } else if (soil2) {
      return "2";
    } else if (soil3) {
      return "3";
    } else {
      return "3";
    }
  }
}
