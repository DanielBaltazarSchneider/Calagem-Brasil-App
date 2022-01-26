import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:calagem_brasil_pro/app/modules/calculate/liming_calibration/bandeija/result_bandeja_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControllerCalibrationBandeja extends GetxController {
  TextEditingController controllerLargura = TextEditingController();
  TextEditingController controllerComprimento = TextEditingController();
  TextEditingController controllerVelocidade = TextEditingController();
  TextEditingController controllerDosagem = TextEditingController();
  TextEditingController controllerPesoColetado = TextEditingController();

  List<double> listPeso = [];
// r'^-?[0-9]+$'
  RegExp _numeric = RegExp(r'^-?[0-9]+$');
  bool isNumeric(String str) {
    return _numeric.hasMatch(str.split('.')[0]);
  }

  changeValues() {
    update();
  }

  addPeso() {
    FocusScope.of(Get.context!).requestFocus(new FocusNode());
    if (controllerPesoColetado.text != '') {
      double _peso = double.parse(controllerPesoColetado.text.replaceAll(',', '.'));
      listPeso.add(_peso);
      controllerPesoColetado.text = "";
      update();
    }
  }

  removePeso(index) {
    FocusScope.of(Get.context!).requestFocus(new FocusNode());
    listPeso.removeAt(index);
    controllerPesoColetado.text = "";
    update();
  }

  irParaResultado() {
    if (controllerLargura.text == "") {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.WARNING,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Atenção!',
        desc: 'Informe a largura da bandeja.',
        btnOkOnPress: () {},
      )..show();
    } else if (controllerComprimento.text == "") {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.WARNING,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Atenção!',
        desc: 'Informe a comprimento da bandeja.',
        btnOkOnPress: () {},
      )..show();
    } else if (listPeso.length == 0) {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.WARNING,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Atenção!',
        desc: 'Informe o peso de pelo menos uma bandeja e clique em +.',
        btnOkOnPress: () {},
      )..show();
    } else {
      Get.to(
        ResultBandejaView(
          largura: isNumeric(controllerLargura.text.replaceAll(',', '.')) ? double.parse(controllerLargura.text.replaceAll(',', '.')) : 0.00,
          comprimento: isNumeric(controllerComprimento.text.replaceAll(',', '.')) ? double.parse(controllerComprimento.text.replaceAll(',', '.')) : 0.00,
          dosagem: isNumeric(controllerDosagem.text.replaceAll(',', '.')) ? double.parse(controllerDosagem.text.replaceAll(',', '.')) : 0.00,
          velocidade: isNumeric(controllerVelocidade.text.replaceAll(',', '.')) ? double.parse(controllerVelocidade.text.replaceAll(',', '.')) : 0.00,
          listPesos: listPeso,
        ),
        transition: Transition.cupertino,
      );
    }
  }
}
