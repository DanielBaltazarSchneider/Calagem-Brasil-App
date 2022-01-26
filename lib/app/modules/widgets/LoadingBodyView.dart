import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingBodyView extends StatelessWidget {
  final double height;
  const LoadingBodyView({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: height,
      color: Colors.white,
      child: Center(
        child: Container(
          width: Get.width * 0.15,
          height: Get.width * 0.15,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      ),
    );
  }
}
