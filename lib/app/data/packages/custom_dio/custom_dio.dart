import 'package:dio/dio.dart';

class CustomDio {
  late Dio _dio;

  CustomDio.noAuthentication() {
    _dio = Dio();
  }

  Dio get instance => _dio;

  CustomDio.login() {
    _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequestLogin,
      onError: _onError,
      onResponse: _onResponse,
    ));
  }

  CustomDio.withAuthentication() {
    _dio = Dio();
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onError: _onError,
        onResponse: _onResponse,
      ),
    );
  }

  _onRequestLogin(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      // String jwt = await AppToken.decriptBearer();
      options.headers["Content-Type"] = "application/json";
      // options.headers["X-TENANT"] = AppController.to.tenant;
      // options.headers["Authorization"] = "Bearer $jwt";
      options.receiveTimeout = 10000;
      options.connectTimeout = 10000;
      options.sendTimeout = 10000;
      return handler.next(options);
    } catch (err) {
      print("ERROR INTERCEPTORS DIO()");
      return handler.next(options);
    }
  }

  _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers["Authorization"] = "Bearer ${AppController.to.user.jwt}";
    // options.headers["X-TENANT"] = AppController.to.tenant;
    // options.headers['Content-Type'] = 'application/json';
    options.receiveTimeout = 180000;
    options.connectTimeout = 180000;
    options.sendTimeout = 60000;
    return handler.next(options);
  }

  _onError(DioError dioError, ErrorInterceptorHandler handler) {
    print("##### Dio() Erro inteceptado #####");
    if (dioError.response?.statusCode != null) {
      print("${dioError.response!.statusCode}");
      print("${dioError.response!.data}");
    }
    print("${dioError.error}");
    print("${dioError.requestOptions.uri}");
    print("");
    print("");
    return handler.next(dioError);
  }

  _onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
