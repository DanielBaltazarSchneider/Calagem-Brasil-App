import 'package:http/http.dart' as http;

Future<bool> haveInternet() async {
  try {
    var url = "https://www.google.com/";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    try {
      var url = "https://www.minhaconexao.com.br/";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      try {
        var url = "https://viacep.com.br/ws/01001000/json/";
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      } catch (e) {
        return false;
      }
    }
  }
}
