import 'package:calagem_brasil_pro/app/app_controller.dart';
import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/data/packages/database/tb_analises/tb_analise_v1.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class NewAnalysisController extends GetxController {
  TextEditingController controllerClient = TextEditingController();
  TextEditingController controllerLocal = TextEditingController();
  TextEditingController controllerArea = TextEditingController();
  TextEditingController controllerHAl = TextEditingController();
  TextEditingController controllerAl = TextEditingController();
  TextEditingController controllerCa = TextEditingController();
  TextEditingController controllerMg = TextEditingController();
  TextEditingController controllerK = TextEditingController();
  TextEditingController controllerNa = TextEditingController(text: "0.0");
  TextEditingController controllerphWater = TextEditingController();

  void createRecord() {
    if (controllerClient.text == "") {
      snack();
    } else if (controllerLocal.text == "") {
      snack();
    } else if (controllerArea.text == "") {
      snack();
    } else if (controllerphWater.text == "") {
      snack();
    } else if (controllerHAl.text == "") {
      snack();
    } else if (controllerAl.text == "") {
      snack();
    } else if (controllerCa.text == "") {
      snack();
    } else if (controllerMg.text == "") {
      snack();
    } else if (controllerK.text == "") {
      snack();
    } else if (controllerNa.text == "") {
      snack();
    } else {
      print("Salvando data");
      modelRecord();
    }
  }

  modelRecord() async {
    SoilAnalysis soilAnalysis = SoilAnalysis(
      dataUpload: DateTime.now(),
      dataEdicao: DateTime.now(),
      uuid: Uuid().v1(),
      uuidUsuario: AppController.to.user.uuidUsuario,
      idAnalise: "0",
      cliente: controllerClient.text,
      local: controllerLocal.text,
      area: double.parse(controllerArea.text),
      hAl: double.parse(controllerHAl.text),
      al: double.parse(controllerAl.text),
      ca: double.parse(controllerCa.text),
      mg: double.parse(controllerMg.text),
      k: double.parse(controllerK.text),
      na: double.parse(controllerNa.text),
      pH: double.parse(controllerphWater.text),
      isUpload: false,
    );

    bool data = await TbAnaliseV1().insert(soilAnalysis);

    if (data) {
      Get.back(result: "Success");
    } else {
      Get.snackbar(
        'Erro',
        'Não foi possível salvar',
        backgroundColor: AppColors.primary,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }

  String convertComma(String text) {
    List pontos = text.replaceAll(',', '.').split('.');
    if (pontos.length > 0) {
      text = "";
      for (int i = 0; i < pontos.length; i++) {
        if (i == 0) {
          text += pontos[i] + ".";
        } else {
          text += pontos[i];
        }
      }
    }
    return text;
  }

  snack() {
    Get.snackbar(
      "Atenção",
      "Informe todos os campos",
      icon: Icon(
        Icons.warning,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 4),
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      margin: EdgeInsets.all(Get.width * 0.01),
    );
  }
}
