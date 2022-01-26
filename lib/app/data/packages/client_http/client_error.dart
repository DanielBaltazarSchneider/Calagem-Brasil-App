import 'dart:convert';

class ClientError {
  ClientError({this.statusCode = "", this.data});
  String statusCode;
  dynamic data;

  String get messageError => "${_messageError()}";

  String _messageError() {
    print("Data: " + data.toString());
    try {
      if (this.data is String) {
        if (!_isJson()) {
          return "ClientError: ${this.data.toString()}";
        }
        return jsonDecode(this.data);
      }
      if (this.data is List) {
        return _decodeMessage(this.data[0]);
      }
      if (this.data is Map) {
        return _decodeMessage(this.data);
      }
      return "ClientError: ${this.data.toString()}";
    } catch (err) {
      print("ClientError: " + err.toString());
      return "ClientError: ${this.data.toString()}";
    }
  }

  _decodeMessage(Map<String, dynamic> msg) {
    return msg["mensagem"];
  }

  bool _isJson() {
    try {
      Map<String, dynamic> _d = jsonDecode(data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
