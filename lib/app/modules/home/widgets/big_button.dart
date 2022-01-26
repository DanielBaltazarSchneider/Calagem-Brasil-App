import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:calagem_brasil_pro/app/theme/app_font_size.dart';
import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({Key? key, required this.title, required this.subTitle, required this.assetImage, required this.onTap}) : super(key: key);

  final String title;
  final String subTitle;
  final String assetImage;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 2 / 2.1,
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorBrandPrimaryMedium,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.colorWhite,
                  ),
                ),
                Image.asset("$assetImage", width: AppSize.width * 0.2),
                Text(
                  "$subTitle",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppColors.colorWhite,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
