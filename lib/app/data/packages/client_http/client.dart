import 'package:calagem_brasil_pro/app/app_controller.dart';

import 'client_http.dart';
import 'client_response.dart';

class Client {
  // GET
  static Future<ClientResponse> get({required String endPoint}) async {
    late ClientResponse response;
    response = await _retryMethodConnectGet(endPoint);
    if (_changeDomainIfNecessary(response)) {
      response = await _retryMethodConnectGet(endPoint);
    }
    _ifResponseSuccessIsFalse(response: response, endPoint: endPoint, method: "GET");
    return response;
  }

  // POST
  static Future<ClientResponse> post({required String endPoint, required dynamic data}) async {
    late ClientResponse response;
    response = await _retryMethodConnectPost(endPoint, data);
    if (_changeDomainIfNecessary(response)) {
      response = await _retryMethodConnectPost(endPoint, data);
    }
    _ifResponseSuccessIsFalse(response: response, endPoint: endPoint, method: "POST", data: data);
    return response;
  }

  // PUT
  static Future<ClientResponse> put({required String endPoint, required Map<String, dynamic> data}) async {
    late ClientResponse response;
    response = await _retryMethodConnectPut(endPoint, data);
    if (_changeDomainIfNecessary(response)) {
      response = await _retryMethodConnectPut(endPoint, data);
    }
    _ifResponseSuccessIsFalse(response: response, endPoint: endPoint, method: "PUT", data: data);
    return response;
  }

  // POST LOGIN
  static Future<ClientResponse> postLogin({required String endPoint, required Map<String, dynamic> data}) async {
    late ClientResponse response;
    print(endPoint);
    print(data);
    response = await _retryMethodConnectPostLogin(endPoint, data);
    if (_changeDomainIfNecessary(response)) {
      response = await _retryMethodConnectPostLogin(endPoint, data);
    }
    _ifResponseSuccessIsFalse(response: response, endPoint: endPoint, method: "POST", data: data);
    return response;
  }

  // Verifica se ocorreu o erro de DNS IP
  static bool _changeDomainIfNecessary(ClientResponse response) {
    // if (!response.status) {
    //   if (response.clientError!.statusCode == "103" || response.clientError!.statusCode == "104") {
    //     SyncController _syncController = Modular.get();
    //     _syncController.changeDomain("appmobile");
    //     print("Alterando o domain para APPMOBILE");
    //     return true;
    //   }
    //   if (response.clientError!.data.toString().toLowerCase().contains("timed out")) {
    //     SyncController _syncController = Modular.get();
    //     _syncController.changeDomain("appmobile");
    //     print("Alterando o domain para APPMOBILE");
    //     return true;
    //   }
    // }
    return false;
  }

  // RETRY GET
  static Future<ClientResponse> _retryMethodConnectGet(String _endPoint) async {
    late ClientResponse response;
    for (int i = 1; i <= 3; i++) {
      print("$i° tentativa");
      response = await ClientHttp.get(endPoint: _endPoint);
      if (response.status) {
        break;
      } else {
        if (errorIsTokenExpired(response: response)) {
          // i = 1;
          await revalidateToken();
        }
      }
    }
    return response;
  }

  // RETRY POST
  static Future<ClientResponse> _retryMethodConnectPost(String _endPoint, dynamic data) async {
    late ClientResponse response;
    for (int i = 1; i <= 3; i++) {
      print("$i° tentativa");
      response = await ClientHttp.post(endPoint: _endPoint, data: data);
      if (response.status) {
        break;
      } else {
        if (errorIsTokenExpired(response: response)) {
          // i = 1;
          await revalidateToken();
        }
      }
    }
    return response;
  }

  // RETRY PUT
  static Future<ClientResponse> _retryMethodConnectPut(String _endPoint, Map<String, dynamic> data) async {
    late ClientResponse response;
    for (int i = 1; i <= 3; i++) {
      print("$i° tentativa");
      response = await ClientHttp.put(endPoint: _endPoint, data: data);

      if (response.status) {
        break;
      } else {
        if (errorIsTokenExpired(response: response)) {
          // i = 1;
          await revalidateToken();
        }
      }
    }
    return response;
  }

  // RETRY POST LOGIN
  static Future<ClientResponse> _retryMethodConnectPostLogin(String _endPoint, Map<String, dynamic> data) async {
    late ClientResponse response;
    for (int i = 1; i <= 3; i++) {
      print("$i° tentativa");
      response = await ClientHttp.postLogin(endPoint: _endPoint, data: data);
      if (response.status) {
        break;
      }
    }
    return response;
  }

  // Se tiver algum erro na resposta da requisição
  static _ifResponseSuccessIsFalse({required ClientResponse response, required String endPoint, dynamic data, required String method}) async {
    // if (!response.status) {
    //   if (method == "GET") {
    //     await LogError().saveLogErrorApi(endPoint: endPoint, response: response, data: response.clientError!.data);
    //   }
    //   if (method == "POST" || method == "PUT") {
    //     await LogError().saveLogErrorEvent(endPoint: endPoint, response: response, data: data);
    //   }
    // }
  }

  // retorna true se o token está expirado
  static bool errorIsTokenExpired({required ClientResponse response}) {
    try {
      if (response.clientError!.statusCode == "401") {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // Caso ocorra invalidação do token
  static Future<bool> revalidateToken() async {
    print("############################## TOKEN ESPIRADO ##############################");
    print("############################## REVALIDANDO ##############################");
    await AppController.to.revalidateToken();
    return true;
  }
}
