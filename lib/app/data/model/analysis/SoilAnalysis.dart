import 'dart:convert';

List<SoilAnalysis> soilAnalysisFromJson(String str) => List<SoilAnalysis>.from(json.decode(str).map((x) => SoilAnalysis.fromJson(x)));

String soilAnalysisToJson(List<SoilAnalysis> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SoilAnalysis {
  SoilAnalysis({
    required this.idAnalise,
    required this.uuid,
    required this.uuidUsuario,
    required this.dataUpload,
    required this.dataEdicao,
    required this.cliente,
    required this.local,
    required this.area,
    required this.pH,
    required this.hAl,
    required this.al,
    required this.ca,
    required this.mg,
    required this.k,
    required this.na,
    required this.isUpload,
    this.isEditing = false,
    this.isDeleted = false,
  });

  String idAnalise;
  String uuid;
  String uuidUsuario;
  DateTime dataUpload;
  DateTime dataEdicao;
  String local;
  String cliente;
  double area;
  double pH;
  double hAl;
  double al;
  double ca;
  double mg;
  double k;
  double na;
  bool isUpload;
  bool isEditing;
  bool isDeleted;

  factory SoilAnalysis.fromJson(Map<String, dynamic> json) => SoilAnalysis(
        idAnalise: json["id_analise"].toString(),
        uuid: json["UUID"] ?? "",
        uuidUsuario: json["uuid_usuario"] ?? "",
        dataUpload: DateTime.parse(json["data_upload"]),
        dataEdicao: DateTime.parse(json["data_edicao"]),
        local: json["local"],
        cliente: json["cliente"] ?? "",
        area: double.parse(json["area"].toString()),
        pH: double.parse(json["pH"].toString()),
        hAl: double.parse(json["HAl"].toString()),
        al: double.parse(json["Al"].toString()),
        ca: double.parse(json["Ca"].toString()),
        mg: double.parse(json["Mg"].toString()),
        k: double.parse(json["K"].toString()),
        na: double.parse(json["Na"].toString()),
        isUpload: json["isUpload"] == null
            ? false
            : json["isUpload"] == 0
                ? false
                : true,
      );

  Map<String, dynamic> toJson() => {
        "id_analise": idAnalise,
        "UUID": uuid,
        "uuid_usuario": uuidUsuario,
        "data_upload": dataUpload.toIso8601String(),
        "data_edicao": dataEdicao.toIso8601String(),
        "local": local,
        "cliente": cliente,
        "area": area,
        "pH": pH,
        "HAl": hAl,
        "Al": al,
        "Ca": ca,
        "Mg": mg,
        "K": k,
        "Na": na,
      };
}
