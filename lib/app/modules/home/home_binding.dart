import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController();
    });

    // Get.lazyPut<HomeController>(() {
    //   return HomeController(
    //     repository: MyRepository(
    //       apiClient: MyApiClient(
    //         httpClient: http.Client(),
    //       ),
    //     ),
    //   );
    // });
  }
}
