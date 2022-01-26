import 'package:calagem_brasil_pro/app/modules/auth/auth_view.dart';
import 'package:calagem_brasil_pro/app/modules/home/home_binding.dart';
import 'package:calagem_brasil_pro/app/modules/home/home_view.dart';
import 'package:calagem_brasil_pro/app/modules/synchronization/sync_view.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final routes = [
    // Auth
    GetPage(
      name: Routes.AUTH,
      page: () => AuthView(),
    ),

    // Home
    GetPage(
      name: Routes.SYNC,
      page: () => SyncView(),
    ),

    // Home
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    // // Romaneio
    // GetPage(
    //   name: Routes.ROMANEIO,
    //   page: () => RomaneioPage(
    //     movimentacao: Get.arguments,
    //   ),
    // ),
  ];
}
