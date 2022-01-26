import 'package:calagem_brasil_pro/app/data/packages/database/tb_analises/tb_analise_v1.dart';
import 'package:calagem_brasil_pro/app/modules/auth/auth_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  TbAnaliseV1 tbAnalise = TbAnaliseV1();
  final db = GetStorage();
  singningOut() async {
    await db.write('password', '');
    await db.write('jsonUser', '');
    await db.write('isLogged', false);
    Get.offAll(() => AuthView());
  }

  deleteAllAnalysis() async {
    await tbAnalise.deleteAll();
    Get.back();
  }
}
