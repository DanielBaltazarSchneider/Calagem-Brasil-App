import 'package:calagem_brasil_pro/app/data/constants/text/descricao_calagem.dart';
import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/data/model/liming/ResultLiming.dart';
import 'package:calagem_brasil_pro/app/modules/pdf/pdf_equilibrio_bases/pdf_view.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  final ResultLiming resultLiming;
  final SoilAnalysis soilAnalysis;

  ResultController({
    required this.resultLiming,
    required this.soilAnalysis,
  }) {
    //print(jsonEncode(resultLiming.toJson()));
  }

  String returnDescriptionMethod() {
    if (resultLiming.idMethod == 1) {
      return DescricaoCalegem.estequiometrico;
    } else if (resultLiming.idMethod == 2) {
      return DescricaoCalegem.equilibrioDeBases;
    } else if (resultLiming.idMethod == 3) {
      return DescricaoCalegem.saturacaoDeBases;
    } else if (resultLiming.idMethod == 4) {
      return DescricaoCalegem.indiceSMP;
    } else if (resultLiming.idMethod == 5) {
      return DescricaoCalegem.aluminioTrocavel;
    } else {
      return "";
    }
  }

  void gerarRelatorioPDF() {
    if (resultLiming.idMethod == 1) {
    } else if (resultLiming.idMethod == 2) {
      Get.to(
        () => PdfEqilibrioBasesView(
          resultLiming: resultLiming,
          soilAnalysis: soilAnalysis,
        ),
      );
    } else if (resultLiming.idMethod == 3) {
    } else if (resultLiming.idMethod == 4) {
    } else if (resultLiming.idMethod == 5) {
    } else {}
  }
}
