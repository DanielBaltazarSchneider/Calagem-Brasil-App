import 'package:calagem_brasil_pro/app/modules/analysis/list_analisis/list_analysis_view.dart';
import 'package:calagem_brasil_pro/app/modules/calculate/liming_calibration/type_calibration_screen.dart';
import 'package:calagem_brasil_pro/app/modules/config/config_view.dart';
import 'package:calagem_brasil_pro/app/modules/schedule/schedule_view.dart';
import 'package:calagem_brasil_pro/app/modules/synchronization/sync_view.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/DrawerMenu.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          endDrawer: DrawerMenu(
            onPressedExit: () => _.singningOut(),
            onPressedConfig: () => Get.to(() => ConfigView()),
            onPressDeleteAnalysis: () => _.deleteAllAnalysis(),
            onPressSyn: () => Get.offAll(() => SyncView()),
          ),
          body: Container(
            width: Get.width,
            child: Column(
              children: [
                SizedBox(height: Get.width * 0.025),
                InkWell(
                  onTap: () => Get.to(() => ScheduleView()),
                  child: Card(
                    child: Container(
                      width: Get.width * 0.9,
                      padding: EdgeInsets.all(Get.width * 0.05),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.1,
                          ),
                          Icon(
                            MdiIcons.calendarMonthOutline,
                            color: AppColors.primary,
                            size: Get.width * 0.09,
                          ),
                          SizedBox(
                            width: Get.width * 0.15,
                          ),
                          Text(
                            "Agenda",
                            style: TextStyle(fontSize: Get.width * 0.045),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(() => ListAnalysisView()),
                  child: Card(
                    child: Container(
                      width: Get.width * 0.9,
                      padding: EdgeInsets.all(Get.width * 0.05),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.1,
                          ),
                          Icon(
                            MdiIcons.formatListBulleted,
                            color: AppColors.primary,
                            size: Get.width * 0.09,
                          ),
                          SizedBox(
                            width: Get.width * 0.15,
                          ),
                          Text(
                            "Análises",
                            style: TextStyle(fontSize: Get.width * 0.045),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: Get.width * 0.9,
                    padding: EdgeInsets.all(Get.width * 0.05),
                    child: Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.1,
                        ),
                        Icon(
                          MdiIcons.calculator,
                          color: AppColors.primary,
                          size: Get.width * 0.09,
                        ),
                        SizedBox(
                          width: Get.width * 0.15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Calcular calagem",
                              style: TextStyle(fontSize: Get.width * 0.045),
                            ),
                            Text(
                              "Rápido",
                              style: TextStyle(fontSize: Get.width * 0.035),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(() => TypeCalibrationView()),
                  child: Card(
                    child: Container(
                      width: Get.width * 0.9,
                      padding: EdgeInsets.all(Get.width * 0.05),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.1,
                          ),
                          Icon(
                            MdiIcons.tractor,
                            color: AppColors.primary,
                            size: Get.width * 0.09,
                          ),
                          SizedBox(
                            width: Get.width * 0.15,
                          ),
                          Text(
                            "Calcular distribuição",
                            style: TextStyle(fontSize: Get.width * 0.045),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
