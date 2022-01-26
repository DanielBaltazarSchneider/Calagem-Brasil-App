import 'package:calagem_brasil_pro/app/data/packages/token/data_token.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:fast_rsa/fast_rsa.dart';

class AppToken {
  static Future<String> decriptBearer() async {
    String decrypted = await RSA.decryptPrivateKey(DataToken.PRIVATE, DataToken.PASS);
    String _app = "mobi";
    String _validity = (DateTime.now().add(Duration(hours: 24)).toUtc().millisecondsSinceEpoch / 1000).toStringAsFixed(0);
    int _exp = int.parse(_validity);

    final JWT jwt = JWT({"app": _app, "exp": _exp});
    return jwt.sign(RSAPrivateKey(decrypted), algorithm: JWTAlgorithm.RS256);
  }

  static Future<bool> singContract() async {
    // try {
    //   ClientResponse response = await Client.get(endPoint: Endpoint.singContract);
    //   if (response.status) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // } catch (e) {
    //   print(e.toString());
    //   // showToast("Erro: ${e.toString()}", backgroundColor: Colors.red[600]);
    //   return false;
    // }
    return false;
  }
}
