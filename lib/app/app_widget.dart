import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_binding.dart';
import 'routes/app_pages.dart';
import 'theme/app_theme.dart';
import 'theme/theme_service.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Calagem Brasil',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeService().theme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.AUTH,
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      locale: Locale('pt', 'BR'),
      // home: AuthView(),
      initialBinding: AppBinding(),
    );
  }
}
