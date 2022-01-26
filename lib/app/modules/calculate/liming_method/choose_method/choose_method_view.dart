import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/modules/calculate/liming_method/calculate/calculate_view.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/CardLimingMethod.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/composition/MyAppBar.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'choose_method_controller.dart';

class ChooseMethodView extends StatelessWidget {
  final SoilAnalysis soilAnalysis;

  const ChooseMethodView({Key? key, required this.soilAnalysis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseMethodController>(
        init: ChooseMethodController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: MyAppBar(
              title: Text("Método de calagem"),
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    CardLimingMethod(
                      onTap: () => Get.to(() => CalculateView(soilAnalysis: soilAnalysis, method: 'estequiometrico')),
                      pathImage: 'assets/images/chemistry.png',
                      method: "Ajuste estequiométrico",
                      subtitle: "Ca, Mg",
                      description: "Brasil",
                    ),
                    Divider(color: AppColors.primary.withOpacity(0.4), thickness: 3),
                    CardLimingMethod(
                      onTap: () => Get.to(() => CalculateView(soilAnalysis: soilAnalysis, method: 'estequiometrico2')),
                      pathImage: 'assets/images/albrecht.png',
                      method: "Equilibrio das bases\n(Albrecht)",
                      subtitle: "Ca, Mg e K",
                      description: "Brasil",
                    ),
                    Divider(color: AppColors.primary.withOpacity(0.4), thickness: 3),
                    CardLimingMethod(
                      onTap: () => Get.to(() => CalculateView(soilAnalysis: soilAnalysis, method: 'saturacao_bases')),
                      pathImage: 'assets/images/soil.png',
                      method: "Saturação de bases",
                      description: "PR - SP - cerrados",
                    ),
                    Divider(color: AppColors.primary.withOpacity(0.4), thickness: 3),
                    CardLimingMethod(
                      onTap: () => Get.to(() => CalculateView(soilAnalysis: soilAnalysis, method: 'smp')),
                      pathImage: 'assets/images/soil.png',
                      method: "Índice SMP\n(Shoemaker, Mac lean e Pratt)",
                      description: "RS - SC",
                    ),
                    Divider(color: AppColors.primary.withOpacity(0.4), thickness: 3),
                    CardLimingMethod(
                      onTap: () => Get.to(() => CalculateView(soilAnalysis: soilAnalysis, method: 'aluminio_trocavel')),
                      pathImage: 'assets/images/soil.png',
                      method: "Alumínio Trocável",
                      description: "MG - GO - MT - MS",
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
