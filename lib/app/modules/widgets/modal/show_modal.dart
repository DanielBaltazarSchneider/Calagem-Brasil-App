import 'package:calagem_brasil_pro/app/theme/app_font_size.dart';
import 'package:flutter/material.dart';

class ShowModal {
  static Future<void> show(context, Widget child) async {
    await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
        return Center(
          child: SafeArea(
            child: Container(
              width: AppSize.width - 10,
              height: AppSize.height - MediaQuery.of(context).padding.top - 10,
              color: Colors.white,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
