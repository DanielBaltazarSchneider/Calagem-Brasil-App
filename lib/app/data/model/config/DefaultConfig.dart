class DefaultConfig {
  String? ca;
  String? mg;
  String? k;
  String? prntCalcite;
  String? prntDolomitic;
  String? vPercent;
  String? calCaO;
  String? calMgO;
  String? dolCaO;
  String? dolMgO;

  DefaultConfig({
    this.ca,
    this.mg,
    this.k,
    this.prntCalcite,
    this.prntDolomitic,
    this.vPercent,
    this.calCaO,
    this.calMgO,
    this.dolCaO,
    this.dolMgO,
  });

  DefaultConfig.fromJson(Map<String, dynamic> json) {
    ca = json['ca'];
    mg = json['mg'];
    k = json['k'];
    prntCalcite = json['prntCalcite'];
    prntDolomitic = json['prntDolomitic'];
    vPercent = json['vPercent'];
    calCaO = json['calCaO'];
    calMgO = json['calMgO'];
    dolCaO = json['dolCaO'];
    dolMgO = json['dolMgO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ca'] = this.ca;
    data['mg'] = this.mg;
    data['k'] = this.k;
    data['prntCalcite'] = this.prntCalcite;
    data['prntDolomitic'] = this.prntDolomitic;
    data['vPercent'] = this.vPercent;
    data['calCaO'] = this.calCaO;
    data['calMgO'] = this.calMgO;
    data['dolCaO'] = this.dolCaO;
    data['dolMgO'] = this.dolMgO;
    return data;
  }
}
