import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';

Widget ConfirmButton({required Function onPressed, required String label}) {
  return Container(
    child: ElevatedButton(
      onPressed: () => onPressed(),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "$label",
          style: TextStyle(fontSize: 14, color: AppColors.colorWhite),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.colorBrandPrimaryMedium),
      ),
    ),
  );
}
