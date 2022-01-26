import 'dart:developer';

import 'package:calagem_brasil_pro/app/data/constants/endpoints.dart';
import 'package:calagem_brasil_pro/app/data/model/communication/comunication.dart';
import 'package:calagem_brasil_pro/app/data/packages/client_http/client.dart';
import 'package:calagem_brasil_pro/app/data/packages/client_http/client_response.dart';

class AuthenticationRepository {
  static Future<Communication> auth({required String email, required String password}) async {
    Map<String, dynamic> data = {"email": email, "password": password};

    ClientResponse response = await Client.postLogin(endPoint: Endpoint.validateAuth, data: data);

    if (response.status) {
      print(response.status);

      log(response.object!.content.status.toString());
      return Communication(status: true, object: response.object);
    }
    return Communication(status: false, message: response.clientError!.messageError);
  }
}
