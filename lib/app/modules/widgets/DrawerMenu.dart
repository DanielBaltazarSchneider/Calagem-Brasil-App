import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DrawerMenu extends StatelessWidget {
  final Function onPressedExit;
  final Function onPressedConfig;
  final Function onPressDeleteAnalysis;
  final Function onPressSyn;

  DrawerMenu({Key? key, required this.onPressedExit, required this.onPressedConfig, required this.onPressDeleteAnalysis, required this.onPressSyn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              child: Icon(
                Icons.grass,
                size: Get.width * 0.2,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: Get.width * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.1,
                  child: IconButton(
                    onPressed: () => onPressedConfig(),
                    icon: Icon(MdiIcons.tune, color: AppColors.primary),
                  ),
                ),
                Container(
                  width: Get.width * 0.4,
                  child: TextButton(
                    onPressed: () => onPressedConfig(),
                    child: Text("Padrões"),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.width * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.1,
                  child: IconButton(
                    onPressed: () => onPressSyn(),
                    icon: Icon(Icons.delete_forever_rounded, color: AppColors.primary),
                  ),
                ),
                Container(
                  width: Get.width * 0.4,
                  child: TextButton(
                    onPressed: () => onPressDeleteAnalysis(),
                    child: Text(
                      "Limpar análises (somete local)",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.width * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.1,
                  child: IconButton(
                    onPressed: () => onPressSyn(),
                    icon: Icon(Icons.sync, color: AppColors.primary),
                  ),
                ),
                Container(
                  width: Get.width * 0.4,
                  child: TextButton(
                    onPressed: () => onPressSyn(),
                    child: Text(
                      "Sincronizar",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.width * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.1,
                  child: IconButton(
                    onPressed: () => onPressedExit(),
                    icon: Icon(Icons.exit_to_app, color: AppColors.primary),
                  ),
                ),
                Container(
                  width: Get.width * 0.4,
                  child: TextButton(
                    onPressed: () => onPressedExit(),
                    child: Text("Sair"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
