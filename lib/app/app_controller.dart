import 'package:calagem_brasil_pro/app/data/model/communication/comunication.dart';
import 'package:calagem_brasil_pro/app/data/packages/token/app_token.dart';
import 'package:calagem_brasil_pro/app/data/repository/authentication_repository/authentication_repository.dart';
import 'package:calagem_brasil_pro/app/data/repository/secure_storage_repository/secure_storage_repository.dart';
import 'package:get/get.dart';

import 'data/model/user_model/user.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  late User user;
  String tenant = "";
  String domain = "";

  void setUser(Map<String, dynamic> newUser) {
    this.user = userFroMap(newUser);
  }

  void setDomain(String newDomain) {
    this.domain = newDomain;
  }

  void setTenantAndDomain(String newTenant) {
    this.tenant = newTenant;
    this.domain = newTenant;
  }

  Future<void> revalidateToken() async {
    String domain = await SecureStorageRepository.readDomainUser();
    String email = await SecureStorageRepository.readEmailUser();
    String password = await SecureStorageRepository.readPasswordUser();
    Communication communication = await AuthenticationRepository.auth(email: email, password: password);
    if (communication.status) {
      // setUser(communication.data);
      AppToken.singContract();
    }
  }
}
