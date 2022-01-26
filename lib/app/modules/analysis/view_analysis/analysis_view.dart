import 'dart:math';

import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/modules/calculate/liming_method/choose_method/choose_method_view.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/CardNutrient.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/ChartEscale.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/composition/MyAppBar.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'analysis_controller.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({Key? key, required this.soilAnalysis}) : super(key: key);

  final SoilAnalysis soilAnalysis;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnalysisController>(
        init: AnalysisController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: MyAppBar(
              title: Text("Dados da Análise"),
            ),
            floatingActionButton: FloatingActionButton.extended(
                backgroundColor: AppColors.tertiary,
                elevation: 20,
                label: Text("Calcular calagem"),
                icon: Icon(Icons.calculate),
                onPressed: () => Get.to(
                      () => ChooseMethodView(
                        soilAnalysis: soilAnalysis,
                      ),
                    )),
            body: SingleChildScrollView(
              child: Container(
                width: Get.width,
                child: Column(
                  children: [
                    Card(
                      margin: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: Get.width * 0.44,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Cliente",
                                        style: TextStyle(fontSize: Get.width * 0.035),
                                      ),
                                      Text(
                                        "${soilAnalysis.cliente}",
                                        style: TextStyle(
                                          fontSize: Get.width * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width * 0.45,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Local",
                                        style: TextStyle(fontSize: Get.width * 0.035),
                                      ),
                                      Text(
                                        "${soilAnalysis.local}",
                                        style: TextStyle(
                                          fontSize: Get.width * 0.045,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: Get.width * 0.45,
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Área total",
                                    style: TextStyle(fontSize: Get.width * 0.035),
                                  ),
                                  Text(
                                    "${soilAnalysis.area}",
                                    style: TextStyle(
                                      fontSize: Get.width * 0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        CardNutrient(
                          element: 'pH água',
                          abbreviation: "pH",
                          value: soilAnalysis.pH,
                          isElement: false,
                        ),
                        CardNutrient(
                          element: 'Acidez potencial',
                          abbreviation: "Al+H",
                          value: soilAnalysis.hAl,
                        ),
                        CardNutrient(
                          element: 'Alumínio',
                          abbreviation: "Al",
                          value: soilAnalysis.al,
                        ),
                        CardNutrient(
                          element: 'Cálcio',
                          abbreviation: "Ca",
                          value: soilAnalysis.ca,
                        ),
                        CardNutrient(
                          element: 'Magnésio',
                          abbreviation: "Mg",
                          value: soilAnalysis.mg,
                        ),
                        CardNutrient(
                          element: 'Potássio',
                          abbreviation: "K",
                          value: soilAnalysis.k,
                        ),
                        CardNutrient(
                          element: 'Sódio',
                          abbreviation: "Na",
                          value: soilAnalysis.na,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Get.width * 0.025),
                      width: Get.width,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: Get.width * 0.02, bottom: Get.width * 0.02),
                            width: Get.width,
                            color: AppColors.primary,
                            child: Column(
                              children: [
                                Text(
                                  'Relações atual entre os nutrientes no solo',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Get.width * 0.025),
                          ChartEscale(
                            titleText: 'Ca/Mg',
                            curentValue: soilAnalysis.ca / soilAnalysis.mg,
                            minEscale: 3,
                            maxEscale: 5,
                            limitMaxEscale: 8,
                            limitMinEscale: 0,
                            intervalScale: 1,
                          ),
                          ChartEscale(
                            titleText: 'Ca/K',
                            curentValue: soilAnalysis.ca / soilAnalysis.k,
                            minEscale: 8,
                            maxEscale: 16,
                            limitMaxEscale: 23,
                            limitMinEscale: 0,
                            intervalScale: 2,
                          ),
                          ChartEscale(
                            titleText: 'Mg/Ca',
                            curentValue: soilAnalysis.mg / soilAnalysis.ca,
                            minEscale: 3,
                            maxEscale: 6,
                            limitMaxEscale: 9,
                            limitMinEscale: 0,
                            intervalScale: 1,
                          ),
                          ChartEscale(
                            titleText: '(Ca+Mg)/K',
                            curentValue: (soilAnalysis.ca + soilAnalysis.mg) / soilAnalysis.k,
                            minEscale: 17,
                            maxEscale: 25,
                            limitMaxEscale: 42,
                            limitMinEscale: 0,
                            intervalScale: 5,
                          ),
                          ChartEscale(
                            title: [
                              Text("K/"),
                              Image.asset(
                                'assets/images/square-root.png',
                                width: 20,
                              ),
                              Text("(Ca+Mg)")
                            ],
                            // titleText: 'K/raiz(Ca+Mg)',
                            curentValue: soilAnalysis.k / sqrt(soilAnalysis.ca + soilAnalysis.mg),
                            minEscale: 0.13,
                            maxEscale: 0.20,
                            limitMaxEscale: 0.33,
                            limitMinEscale: 0,
                            intervalScale: 0.05,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: Get.width * 0.02, bottom: Get.width * 0.02),
                            width: Get.width,
                            color: AppColors.primary,
                            child: Column(
                              children: [
                                Text(
                                  'CTC total do solo',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Get.width * 0.025),
                          ChartEscale(
                            title: [
                              Text("CTC "),
                              Text("cmol"),
                              Text(
                                "c",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text("/dm³")
                            ],
                            curentValue: soilAnalysis.ca + soilAnalysis.mg + soilAnalysis.k + soilAnalysis.hAl + soilAnalysis.na,
                            minEscale: 10,
                            maxEscale: 25,
                            limitMaxEscale: 35,
                            limitMinEscale: 0,
                            intervalScale: 5,
                          ),
                          ChartEscale(
                            titleText: 'V%',
                            curentValue: ((soilAnalysis.ca + soilAnalysis.mg + soilAnalysis.k + soilAnalysis.na) * 100) /
                                (soilAnalysis.ca + soilAnalysis.mg + soilAnalysis.k + soilAnalysis.hAl + soilAnalysis.na),
                            minEscale: 65,
                            maxEscale: 75,
                            limitMaxEscale: 100,
                            limitMinEscale: 0,
                            intervalScale: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: Get.width * 0.02, bottom: Get.width * 0.02),
                            width: Get.width,
                            color: AppColors.primary,
                            child: Column(
                              children: [
                                Text(
                                  'Participação dos nutrientes na CTC do solo',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Get.width * 0.045),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Get.width * 0.025),
                          ChartEscale(
                            titleText: 'Ca %',
                            curentValue: ((soilAnalysis.ca) * 100) / (soilAnalysis.ca + soilAnalysis.mg + soilAnalysis.k + soilAnalysis.hAl + soilAnalysis.na),
                            minEscale: 50,
                            maxEscale: 65,
                            limitMaxEscale: 100,
                            limitMinEscale: 0,
                            intervalScale: 10,
                          ),
                          ChartEscale(
                            titleText: 'Mg %',
                            curentValue: ((soilAnalysis.mg) * 100) / (soilAnalysis.ca + soilAnalysis.mg + soilAnalysis.k + soilAnalysis.hAl + soilAnalysis.na),
                            minEscale: 10,
                            maxEscale: 20,
                            limitMaxEscale: 60,
                            limitMinEscale: 0,
                            intervalScale: 10,
                          ),
                          ChartEscale(
                            titleText: 'K %',
                            curentValue: ((soilAnalysis.k) * 100) / (soilAnalysis.ca + soilAnalysis.mg + soilAnalysis.k + soilAnalysis.hAl + soilAnalysis.na),
                            minEscale: 3,
                            maxEscale: 5,
                            limitMaxEscale: 15,
                            limitMinEscale: 0,
                            intervalScale: 3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.width * 0.15),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
