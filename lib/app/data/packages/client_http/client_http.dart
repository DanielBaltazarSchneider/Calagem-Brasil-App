import 'package:calagem_brasil_pro/app/data/packages/client_http/object.dart';
import 'package:calagem_brasil_pro/app/data/packages/custom_dio/custom_dio.dart';
import 'package:dio/dio.dart';

import 'client_error.dart';
import 'client_response.dart';

class ClientHttp {
  static Future<ClientResponse> get({required String endPoint}) async {
    try {
      Dio _dio = CustomDio.withAuthentication().instance;
      var response = await _dio.get(endPoint);
      print("");
      print("$endPoint");
      print(response.data);
      print("");

      return ClientResponse(status: true, object: objectApiFromMap(response.data["object"]));
    } on DioError catch (error) {
      return _processDioError(error);
    } catch (error) {
      return _processExceptionError(error);
    }
  }

  static Future<ClientResponse> post({required String endPoint, required dynamic data}) async {
    try {
      Dio _dio = CustomDio.withAuthentication().instance;
      var response = await _dio.post(endPoint, data: FormData.fromMap(data));
      print("");
      print("$endPoint");
      print(response.data);
      print("");
      return ClientResponse(status: true, object: objectApiFromMap(response.data["object"]));
    } on DioError catch (error) {
      return _processDioError(error);
    } catch (error) {
      return _processExceptionError(error);
    }
  }

  static Future<ClientResponse> put({required String endPoint, required Map<String, dynamic> data}) async {
    try {
      Dio _dio = CustomDio.withAuthentication().instance;
      var response = await _dio.put(endPoint, data: FormData.fromMap(data));
      print("");
      print("$endPoint");
      print(response.data);
      print("");
      return ClientResponse(status: true, object: objectApiFromMap(response.data["object"]));
    } on DioError catch (error) {
      return _processDioError(error);
    } catch (error) {
      return _processExceptionError(error);
    }
  }

  static Future<ClientResponse> postLogin({required String endPoint, required Map<String, dynamic> data}) async {
    try {
      Dio _dio = CustomDio.login().instance;
      var response = await _dio.post(endPoint, data: FormData.fromMap(data));
      print(response.data);
      return ClientResponse(status: true, object: objectApiFromMap(response.data["object"]));
    } on DioError catch (error) {
      return _processDioError(error);
    } catch (error) {
      return _processExceptionError(error);
    }
  }

  static ClientResponse _processExceptionError(error) {
    ClientError clientError = ClientError(
      data: {"mensagem": "Erro na requisição -> $error"},
      statusCode: "0",
    );
    return ClientResponse(status: false, object: null, clientError: clientError);
  }

  static ClientResponse _processDioError(DioError error) {
    ClientError clientError = ClientError(
      data: error.response?.data ?? {"mensagem": "Erro na requisição -> ${error.error}"},
      statusCode: error.response!.statusCode.toString(),
    );
    return ClientResponse(status: false, object: null, clientError: clientError);
  }
}
