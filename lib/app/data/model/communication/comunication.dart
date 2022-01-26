import 'package:calagem_brasil_pro/app/data/packages/client_http/object.dart';

class Communication {
  bool status;
  String message;
  ObjectApi? object;

  Communication({required this.status, this.message = "", this.object});
}
