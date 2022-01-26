import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:calagem_brasil_pro/app/theme/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerBackgroundImage extends StatelessWidget {
  const ContainerBackgroundImage({Key? key, required this.child}) : super(key: key);

  final Widget child;

  String returnPathImagePlatform() {
    if (GetPlatform.isAndroid || GetPlatform.isIOS) {
      if (AppSize.width > AppSize.height) {
        return "assets/images/png/fundo_tablet.png";
      }
      return "assets/images/png/fundo_mobile.png";
    }
    return "assets/images/png/fundo_web.png";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(AppColors.colorBrandPrimaryMedium, BlendMode.multiply),
          child: Container(
            width: AppSize.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(returnPathImagePlatform()),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          width: AppSize.width,
          height: AppSize.height,
          child: child,
        ),
      ],
    );
  }
}
