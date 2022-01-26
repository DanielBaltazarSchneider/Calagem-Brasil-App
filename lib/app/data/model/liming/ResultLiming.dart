class ResultLiming {
  String? uid;
  String? dateAnalysis;
  String? dateCalculation;
  String? method;
  int? idMethod;
  double? calciteLimestone;
  double? dolomiticLimestone;
  double? potassiumFertilization;
  double? prntCalcite;
  double? prntDolomitic;
  double? calCaO;
  double? calMgO;
  double? dolCaO;
  double? dolMgO;
  double? elevaCa;
  double? elevaMg;
  double? elevaK;
  double? desiredPH;
  String? soilType;

  ResultLiming({
    this.uid,
    this.dateAnalysis,
    this.dateCalculation,
    this.method,
    this.idMethod,
    this.calciteLimestone,
    this.dolomiticLimestone,
    this.potassiumFertilization,
    this.prntDolomitic,
    this.prntCalcite,
    this.calCaO,
    this.calMgO,
    this.dolCaO,
    this.dolMgO,
    this.elevaCa,
    this.elevaMg,
    this.elevaK,
    this.desiredPH,
    this.soilType,
  });

  ResultLiming.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    dateAnalysis = json['date_analysis'];
    dateCalculation = json['date_calculation'];
    method = json['method'];
    idMethod = json['idMethod'];
    calciteLimestone = json['calcite_limestone'];
    dolomiticLimestone = json['dolomitic_limestone'];
    potassiumFertilization = json['potassiumFertilization'];
    prntCalcite = json['prnt_calcite'];
    prntDolomitic = json['prnt_dolomitic'];
    calCaO = json['calCaO'];
    calMgO = json['calMgO'];
    dolCaO = json['dolCaO'];
    dolMgO = json['dolMgO'];
    elevaCa = json['elevaCa'];
    elevaMg = json['elevaMg'];
    elevaK = json['elevaK'];
    desiredPH = json['desiredPH'];
    soilType = json['soilType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['date_analysis'] = this.dateAnalysis;
    data['date_calculation'] = this.dateCalculation;
    data['method'] = this.method;
    data['idMethod'] = this.idMethod;
    data['calciteLimestone'] = this.calciteLimestone;
    data['dolomiticLimestone'] = this.dolomiticLimestone;
    data['potassiumFertilization'] = this.potassiumFertilization;
    data['prnt_calcite'] = this.prntCalcite;
    data['prnt_dolomitic'] = this.prntDolomitic;
    data['calCaO'] = this.calCaO;
    data['calMgO'] = this.calMgO;
    data['dolCaO'] = this.dolCaO;
    data['dolMgO'] = this.dolMgO;
    data['elevaCa'] = this.elevaCa;
    data['elevaMg'] = this.elevaMg;
    data['elevaK'] = this.elevaK;
    data['desiredPH'] = this.desiredPH;
    data['soilType'] = this.soilType;
    return data;
  }
}
