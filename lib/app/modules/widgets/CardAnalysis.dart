import 'package:calagem_brasil_pro/app/data/extensions/app_double.dart';
import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardAnalysis extends StatelessWidget {
  final SoilAnalysis soilAnalysis;

  const CardAnalysis({Key? key, required this.soilAnalysis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Get.width * 0.015),
      child: Column(
        children: [
          Container(
            width: Get.width,
            padding: EdgeInsets.all(Get.width * 0.015),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  soilAnalysis.cliente.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (soilAnalysis.isUpload) ...[
                  Icon(Icons.cloud_done, size: Get.width * 0.035, color: Colors.white),
                ] else ...[
                  Icon(Icons.update, size: Get.width * 0.035, color: Colors.white),
                ],
              ],
            ),
          ),
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2, color: AppColors.primary),
            ),
            child: Container(
              padding: EdgeInsets.all(Get.width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    soilAnalysis.local.toString(),
                    style: TextStyle(fontSize: Get.width * 0.04),
                  ),
                  Text(
                    soilAnalysis.area.format_1() + " ha",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          // Text("isUpload: ${soilAnalysis.isUpload}"),
          // Text("${GlobalController.to.user.uuidUsuario}"),
          // Text("isEditing: ${soilAnalysis.isEditing}"),
          // Text("isDeleted: ${soilAnalysis.isDeleted}"),
        ],
      ),
    );
  }
}
