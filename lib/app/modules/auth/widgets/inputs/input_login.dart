import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:calagem_brasil_pro/app/theme/app_font_size.dart';
import 'package:flutter/material.dart';

class InputLogin extends StatelessWidget {
  InputLogin({
    Key? key,
    this.controller,
    required this.label,
    required this.iconData,
    this.obscureText = false,
    this.rightIconData,
    this.onTapVisibility,
  }) : super(key: key);
  final TextEditingController? controller;
  final String label;
  final IconData iconData;
  final IconData? rightIconData;
  final bool obscureText;
  final Function? onTapVisibility;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.size * 0.9,
      decoration: BoxDecoration(color: AppColors.colorWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Icon(
              iconData,
              color: AppColors.colorNeutralMedium,
            ),
          ),
          Expanded(
            flex: rightIconData == null ? 9 : 7,
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.colorNeutralDarkestMedium,
                fontWeight: FontWeight.w500,
              ),
              cursorColor: AppColors.colorNeutralMedium,
              decoration: InputDecoration(
                labelText: "$label",
                labelStyle: TextStyle(color: AppColors.colorNeutralMedium, fontSize: 13),
                border: InputBorder.none,
                // contentPadding: EdgeInsets.all(0),
              ),
            ),
          ),
          if (rightIconData != null)
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  if (onTapVisibility != null) {
                    onTapVisibility!();
                  }
                },
                child: Icon(
                  rightIconData,
                  color: AppColors.colorNeutralMedium,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
