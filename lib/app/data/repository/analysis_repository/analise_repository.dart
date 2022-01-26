import 'dart:convert';

import '../../model/analysis/SoilAnalysis.dart';

class AnalysesRepository {
  static Future<List<SoilAnalysis>> getOnlineAnalyses(String uuidLast) async {
    // print("PROVIDER getOnlineAnalises");
    // var url = "${Endpoint.getAnalysisUser()}/${GlobalController.to.user.uuidUsuario}/$uuidLast";
    // MyResponse myResponse = await HTTP.get(url: url);
    // print(myResponse.body);
    // if (myResponse.status) {
    //   print(myResponse.body);
    //   return soilAnalysisFromJson(jsonEncode(myResponse.body));
    // } else {
    //   print(myResponse.status);
    //   return [];
    // }
    return [];
  }

  static Future<List<SoilAnalysis>> uploadAnalises(List<SoilAnalysis> analises) async {
    // String json = _convertListAnalysesToJson(analises);
    // print("JSON to UPLOAD: " + json);
    //
    // var url = Endpoint.uploadAnalysis();
    // MyResponse myResponse = await HTTP.post(url: url, body: {"json": json});
    //
    // if (myResponse.status) {
    //   print(myResponse.body);
    //   return soilAnalysisFromJson(jsonEncode(myResponse.body));
    // } else {
    //   print(myResponse.status);
    //   return [];
    // }
    return [];
  }

  static String _convertListAnalysesToJson(List<SoilAnalysis> analises) {
    List json = [];
    for (SoilAnalysis analise in analises) {
      json.add(analise.toJson());
    }
    return jsonEncode(json);
  }
}
