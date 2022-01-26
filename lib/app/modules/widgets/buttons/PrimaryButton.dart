import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String btnText;
  final Function onTap;

  PrimaryButton({required this.btnText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
