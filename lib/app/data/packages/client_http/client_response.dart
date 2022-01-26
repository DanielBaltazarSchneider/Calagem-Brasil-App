import 'package:calagem_brasil_pro/app/data/packages/client_http/object.dart';

import 'client_error.dart';

class ClientResponse {
  ClientResponse({required this.status, required this.object, this.clientError});

  bool status;
  ObjectApi? object;
  ClientError? clientError;
}
