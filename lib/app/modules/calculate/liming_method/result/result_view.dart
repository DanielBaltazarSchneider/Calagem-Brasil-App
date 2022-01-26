import 'package:calagem_brasil_pro/app/data/extensions/app_double.dart';
import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/data/model/liming/ResultLiming.dart';
import 'package:calagem_brasil_pro/app/modules/calculate/liming_method/result/result_controller.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/composition/MyAppBar.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ResultView extends StatelessWidget {
  final ResultLiming resultLiming;
  final SoilAnalysis soilAnalysis;

  const ResultView({
    Key? key,
    required this.resultLiming,
    required this.soilAnalysis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultController>(
      init: ResultController(
        resultLiming: resultLiming,
        soilAnalysis: soilAnalysis,
      ),
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: MyAppBar(
            title: Text("Resultado"),
          ),
          body: Column(
            children: [
              // Container(
              //   padding: EdgeInsets.all(Get.width * 0.025),
              //   width: Get.width,
              //   color: AppColors.primary,
              //   child: Center(
              //       child: Text(
              //     "${resultLiming.method}",
              //     style: TextStyle(fontSize: Get.width * 0.045, color: Colors.white),
              //   )),
              // ),
              //if (double.parse(resultLiming.calciteLimestone.toString()) > 0.0)
              // Text(
              //   'Calcítico: ${MyNumberFormat.format_2(double.parse(resultLiming.calciteLimestone.toString()))} Kg/ha',
              //   style: TextStyle(fontSize: Get.width * 0.045),
              // ),
              // //if (double.parse(resultLiming.dolomiticLimestone.toString()) > 0.0)
              // Text(
              //   'Dolomítico: ${MyNumberFormat.format_2(double.parse(resultLiming.dolomiticLimestone.toString()))} Kg/ha',
              //   style: TextStyle(fontSize: Get.width * 0.045),
              // ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Recomendação de calagem".toUpperCase(),
                  style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03),
                          padding: EdgeInsets.all(Get.width * 0.05),
                          color: AppColors.primary,
                          child: Text(
                            _.returnDescriptionMethod(),
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: AppColors.quaternary, fontSize: Get.width * 0.043),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: Get.width * 0.03, right: Get.width * 0.03),
                          padding: EdgeInsets.all(Get.width * 0.05),
                          color: AppColors.quaternary,
                          child: Column(
                            children: [
                              if (resultLiming.calciteLimestone! > 0.0)
                                Row(
                                  children: [
                                    Text(
                                      'Calcário calcítico:  ',
                                      style: TextStyle(color: AppColors.primary, fontSize: Get.width * 0.043),
                                    ),
                                    Text(
                                      '${double.parse(resultLiming.calciteLimestone.toString()).format_0()} Kg/ha',
                                      style: TextStyle(color: AppColors.primary, fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              if (resultLiming.dolomiticLimestone! > 0.0)
                                Row(
                                  children: [
                                    Text(
                                      'Calcário Dolomítico:  ',
                                      style: TextStyle(color: AppColors.primary, fontSize: Get.width * 0.043),
                                    ),
                                    Text(
                                      '${double.parse(resultLiming.dolomiticLimestone.toString()).format_0()} Kg/ha',
                                      style: TextStyle(color: AppColors.primary, fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              if (resultLiming.potassiumFertilization != null) ...[
                                if (resultLiming.potassiumFertilization! > 0)
                                  Row(
                                    children: [
                                      Text(
                                        'Cloreto de potássio:  ',
                                        style: TextStyle(color: AppColors.primary, fontSize: Get.width * 0.043),
                                      ),
                                      Text(
                                        '${double.parse(resultLiming.potassiumFertilization.toString()).format_0()} Kg/ha',
                                        style: TextStyle(color: AppColors.primary, fontSize: Get.width * 0.05, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Get.width * 0.15),
              if (resultLiming.idMethod == 2) ...[
                Container(
                  width: Get.width * 0.65,
                  child: ElevatedButton(
                    onPressed: () => _.gerarRelatorioPDF(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("Gerar relatório"), Icon(MdiIcons.filePdfBox)],
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.primary),
                      padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(fontSize: Get.width * 0.045),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
