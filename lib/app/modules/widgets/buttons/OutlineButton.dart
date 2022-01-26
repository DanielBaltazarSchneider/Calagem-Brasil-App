import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';

class OutlineBtn extends StatelessWidget {
  final String btnText;

  OutlineBtn({required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: AppColors.primary, width: 2), borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(
          btnText,
          style: TextStyle(color: AppColors.primary, fontSize: 12),
        ),
      ),
    );
  }
}
