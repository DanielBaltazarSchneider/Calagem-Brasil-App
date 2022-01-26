import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  static void successSnackBar(BuildContext context, label) {
    double width = MediaQuery.of(context).size.width;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 3000),
        backgroundColor: AppColors.colorSuccess,
        content: Row(
          children: [
            Icon(Icons.check, color: AppColors.colorWhite),
            SizedBox(width: 8),
            Container(
              width: (width * 0.7),
              child: Text(
                label,
                style: TextStyle(color: AppColors.colorWhite, fontSize: (width / 25)),
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void infoSnackBar(BuildContext context, label) {
    double width = MediaQuery.of(context).size.width;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.blueAccent,
        content: Row(
          children: [
            Icon(
              Icons.info,
              color: AppColors.colorWhite,
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: (width * 0.7),
              child: Text(
                label,
                style: TextStyle(color: AppColors.colorWhite, fontSize: (width / 25)),
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        )));
  }

  static void warningSnackBar(BuildContext context, label) {
    double width = MediaQuery.of(context).size.width;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: Duration(milliseconds: 3000),
          backgroundColor: AppColors.colorAlert,
          content: Row(
            children: [
              Container(
                width: (width * 0.8),
                child: Text(
                  label,
                  style: TextStyle(
                    color: AppColors.colorBlack,
                    fontSize: (width / 25),
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),
              Icon(
                Icons.error_outline,
                color: AppColors.colorBlack,
              )
            ],
          )),
    );
  }

  static void errorSnackBar(BuildContext context, label) {
    double width = MediaQuery.of(context).size.width;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: Duration(milliseconds: 3000),
          backgroundColor: AppColors.colorError,
          content: Row(
            children: [
              Container(
                width: (width * 0.8),
                child: Text(
                  label,
                  style: TextStyle(color: AppColors.colorWhite, fontSize: (width / 25)),
                  overflow: TextOverflow.clip,
                ),
              ),
              Icon(
                Icons.error_outline,
                color: AppColors.colorWhite,
              )
            ],
          )),
    );
  }
}
