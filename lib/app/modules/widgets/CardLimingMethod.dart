import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardLimingMethod extends StatelessWidget {
  final String pathImage;
  final String method;
  final String description;
  final String subtitle;
  final Function onTap;

  const CardLimingMethod({Key? key, required this.pathImage, required this.method, this.description = "", required this.onTap, this.subtitle = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(Get.width * 0.025),
        child: Row(
          children: [
            Container(
              width: Get.width * 0.22,
              height: Get.width * 0.22,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.primary, width: 2),
                borderRadius: BorderRadius.circular(500),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.asset(
                      pathImage,
                      width: Get.width * 0.2,
                      height: Get.width * 0.2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width * 0.7,
              padding: EdgeInsets.only(left: Get.width * 0.05),
              child: Column(
                children: [
                  FittedBox(
                    child: Text(
                      method,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: Get.width * 0.050),
                    ),
                  ),
                  if (subtitle != "") ...[
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: Get.width * 0.03),
                    )
                  ],
                  if (description != "") ...[
                    Text(
                      description,
                      style: TextStyle(fontSize: Get.width * 0.04),
                    )
                  ],
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
