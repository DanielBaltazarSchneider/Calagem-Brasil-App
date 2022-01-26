import 'dart:convert';

import 'package:calagem_brasil_pro/app/app_controller.dart';
import 'package:calagem_brasil_pro/app/data/model/config/DefaultConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DefaultConfigController extends GetxController {
  final storage = GetStorage();
  DefaultConfig defaulConfig = new DefaultConfig();
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

  DefaultConfigController() {
    returnStorageConfigValues();
  }

  returnStorageConfigValues() {
    try {
      String jsonConfig = storage.read('defaultConfig_${AppController.to.user.uuidUsuario}');
      defaulConfig = DefaultConfig.fromJson(jsonDecode(jsonConfig));
      controllerCa.text = defaulConfig.ca.toString();
      controllerMg.text = defaulConfig.mg.toString();
      controllerK.text = defaulConfig.k.toString();
      controllerPRNTcalcite.text = defaulConfig.prntCalcite.toString();
      controllerPRNTdolomitic.text = defaulConfig.prntDolomitic.toString();
      controllerVpercent.text = defaulConfig.vPercent.toString();
      controllerCalCaO.text = defaulConfig.calCaO.toString();
      controllerCalMgO.text = defaulConfig.calMgO.toString();
      controllerDolCaO.text = defaulConfig.dolCaO.toString();
      controllerDolMgO.text = defaulConfig.dolMgO.toString();
      update();
    } catch (err) {
      print('Não definidos');
      controllerCa.text = '55';
      controllerMg.text = '15';
      controllerK.text = '4';
      controllerPRNTcalcite.text = '100';
      controllerPRNTdolomitic.text = '100';
      controllerVpercent.text = '70';
      controllerCalCaO.text = '40';
      controllerCalMgO.text = '4';
      controllerDolCaO.text = '30';
      controllerDolMgO.text = '22';
    }
  }

  saveStorageValues() {
    DefaultConfig newDefaultConfig = DefaultConfig(
      ca: controllerCa.text,
      mg: controllerMg.text,
      k: controllerK.text,
      prntCalcite: controllerPRNTcalcite.text,
      prntDolomitic: controllerPRNTdolomitic.text,
      vPercent: controllerVpercent.text,
      calCaO: controllerCalCaO.text,
      calMgO: controllerCalMgO.text,
      dolCaO: controllerDolCaO.text,
      dolMgO: controllerDolMgO.text,
    );
    storage.write('defaultConfig_${AppController.to.user.uuidUsuario}', jsonEncode(newDefaultConfig.toJson()));
    Get.back();
  }
}
