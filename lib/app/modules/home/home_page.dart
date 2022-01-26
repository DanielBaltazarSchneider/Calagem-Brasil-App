import 'package:calagem_brasil_pro/app/modules/home/home_controller.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/app_bar/custom_app_bar.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/drawer/drawer_app.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:calagem_brasil_pro/app/theme/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.colorWhite,
        appBar: CustomAppBar().bar(),
        endDrawer: DrawerApp(),
        body: Stack(
          children: [
            Container(
              width: AppSize.width,
              height: AppSize.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.colorBrandPrimaryMedium.withOpacity(0.15),
                    AppColors.colorWhite,
                    AppColors.colorWhite,
                    AppColors.colorWhite,
                    AppColors.colorWhite,
                    AppColors.colorWhite,
                    AppColors.colorWhite,
                    AppColors.colorWhite,
                    AppColors.colorWhite,
                    AppColors.colorWhite,
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
