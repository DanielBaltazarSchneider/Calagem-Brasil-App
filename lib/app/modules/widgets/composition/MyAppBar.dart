import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    final Color? backgroundColor,
    final Widget? title,
    final List<Widget>? actions,
    final double? elevation,
    final bool? centerTitle,
  }) : super(
          title: title,
          backgroundColor: backgroundColor ?? AppColors.primary,
          centerTitle: centerTitle ?? true,
          actions: actions ?? [],
          elevation: elevation ?? 0,
        );
}
