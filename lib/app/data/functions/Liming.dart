import 'package:calagem_brasil_pro/app/data/constants/number/teores_elementos.dart';
import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/data/model/liming/ResultLiming.dart';
import 'package:calagem_brasil_pro/app/data/model/smp/SMP.dart';

class Liming {
  /// #### 1 #### MÉTODO ESTEQUIMÉTRICO
  ResultLiming stoichiometric({
    required SoilAnalysis soilAnalysis,
    required double prntCalcite,
    required double prntDolomitic,
    required double elevaCa,
    required double elevaMg,
    required double elevaK,
    required double calcao,
    required double calmgo,
    required double dolcao,
    required double dolmgo,
  }) {
    double calciteLimestone = 0.0;
    double dolomiticLimestone = 0.0;
    double HAl = double.parse(soilAnalysis.hAl.toString());
    double Ca = double.parse(soilAnalysis.ca.toString());
    double Mg = double.parse(soilAnalysis.mg.toString());
    double K = double.parse(soilAnalysis.k.toString());
    double Na = double.parse(soilAnalysis.na.toString());
    double CTC = HAl + Ca + Mg + K + Na;
    double CaMg = Ca / Mg;

    double CaO = ((CTC * (elevaCa / 100)) - Ca) * (200 * 2 * 1.4);
    double MgO = ((CTC * (elevaMg / 100)) - Mg) * (120 * 2 * 1.667);

    double Cal_CaO = calcao / 100;
    double Cal_MgO = calmgo / 100;
    double Dol_CaO = dolcao / 100;
    double Dol_MgO = dolmgo / 100;
    double PRNTcalcitico = prntCalcite; //PRNT
    double PRNTdolomitico = prntDolomitic; //PRNT
    double f = Dol_CaO / Dol_MgO;
    double new_MgO = f * MgO;
    double new_CaMgO = f * Cal_MgO;
    double sobraCal = CaO - new_MgO;
    double sobraCaO = Cal_CaO - new_CaMgO;
    double QCalc = (sobraCal / sobraCaO) * (100 / PRNTcalcitico);
    double QDol = ((MgO - (Cal_MgO * QCalc)) / Dol_MgO) * (100 / PRNTdolomitico);

    if (QDol < 0) {
      calciteLimestone = QCalc;
      dolomiticLimestone = 0;
    } else if (QCalc < 0) {
      dolomiticLimestone = QDol;
    } else {
      calciteLimestone = QCalc;
      dolomiticLimestone = QDol;
    }

    return ResultLiming(
      uid: soilAnalysis.uuid,
      dateAnalysis: soilAnalysis.dataUpload.toString(),
      dateCalculation: DateTime.now().toString(),
      method: "Estequiométrico",
      idMethod: 1,
      calciteLimestone: calciteLimestone,
      dolomiticLimestone: dolomiticLimestone,
      prntCalcite: prntCalcite,
      prntDolomitic: prntDolomitic,
      elevaCa: elevaCa,
      elevaMg: elevaMg,
      elevaK: elevaK,
      calCaO: calcao,
      calMgO: calmgo,
      dolCaO: dolcao,
      dolMgO: dolmgo,
      desiredPH: 0,
      soilType: "0",
    );
  }

  /// #### 2 #### MÉTODO EQUILIBRIO DE BASES
  ResultLiming stoichiometric2({
    required SoilAnalysis soilAnalysis,
    required double prntCalcite,
    required double prntDolomitic,
    required double elevaCa,
    required double elevaMg,
    required double elevaK,
    required double calcao,
    required double calmgo,
    required double dolcao,
    required double dolmgo,
  }) {
    double dolomiticLimestone = 0.0;
    double calciteLimestone = 0.0;

    double HAl = double.parse(soilAnalysis.hAl.toString());
    double Ca = double.parse(soilAnalysis.ca.toString());
    double Mg = double.parse(soilAnalysis.mg.toString());
    double K = double.parse(soilAnalysis.k.toString());
    double Na = double.parse(soilAnalysis.na.toString());
    double CTC = HAl + Ca + Mg + K + Na;

    // Teores desejados no solo
    double desejCa = CTC * elevaCa / 100;
    double desejMg = CTC * elevaMg / 100;
    double desejK = CTC * elevaK / 100;

    // Teores dos calcários e potássio
    double teorCa_CaO = 71.46831199;
    double teorMg_MgO = 60.30269197;
    double teorK_K2O = 83.01424892;

    double defCa = (((desejCa - Ca) * 0.2004 * 2 * 1000 * 100) / teorCa_CaO); //.round().toDouble();
    double defMg = (((desejMg - Mg) * 0.1215250 * 2 * 1000 * 100) / teorMg_MgO); //.round().toDouble();
    double defKCl = (((((desejK - K) * 0.391 * 2 * 1000 * 100) / teorK_K2O) * 100) / 60); // KCl

    print("deficiencia de potassio: $defKCl");

    double fator = ((calcao / 100) / (calmgo / 100));

    double x = ((dolmgo / 100) * fator) - (dolcao / 100);
    double y = (defMg * fator) - defCa;

    dolomiticLimestone = (y / x);
    dolomiticLimestone = (dolomiticLimestone * 100) / prntCalcite;

    calciteLimestone = (defCa - (dolomiticLimestone * (dolcao / 100))) / (calcao / 100);
    calciteLimestone = (calciteLimestone * 100) / prntDolomitic;

    return ResultLiming(
      uid: soilAnalysis.uuid,
      dateAnalysis: soilAnalysis.dataUpload.toString(),
      dateCalculation: DateTime.now().toString(),
      method: "Equilibrio das bases (Albrecht)",
      idMethod: 2,
      calciteLimestone: calciteLimestone,
      dolomiticLimestone: dolomiticLimestone,
      potassiumFertilization: defKCl,
      prntCalcite: prntCalcite,
      prntDolomitic: prntDolomitic,
      elevaCa: elevaCa,
      elevaMg: elevaMg,
      elevaK: elevaK,
      calCaO: calcao,
      calMgO: calmgo,
      dolCaO: dolcao,
      dolMgO: dolmgo,
      desiredPH: 0,
      soilType: "0",
    );
  }

  /// #### 3 #### MÉTODO SOMA DE BASES
  ResultLiming sumOfBases({required SoilAnalysis soilAnalysis, required double prntCalcite, required double prntDolomitic}) {
    double calciteLimestone = 0.0;
    double dolomiticLimestone = 0.0;

    double HAl = double.parse(soilAnalysis.hAl.toString());
    double Ca = double.parse(soilAnalysis.ca.toString());
    double Mg = double.parse(soilAnalysis.mg.toString());
    double K = double.parse(soilAnalysis.k.toString());
    double Na = double.parse(soilAnalysis.na.toString());
    double CTC = HAl + Ca + Mg + K + Na;
    double CaMg = Ca / Mg;
    double SB = Ca + Mg + K + Na;
    double V1 = (SB * 100) / CTC;
    double V2 = 70;
    double PRNT;
    if (CaMg < 4) {
      PRNT = prntCalcite;
    } else {
      PRNT = prntDolomitic;
    }

    double NC = (CTC * (V2 - V1) / PRNT) * 1000;
    if (NC < 0) {
      NC = 0;
    }

    if (CaMg < 4) {
      calciteLimestone = NC;
    } else {
      dolomiticLimestone = NC;
    }
    return ResultLiming(
      uid: soilAnalysis.uuid,
      dateAnalysis: soilAnalysis.dataUpload.toString(),
      dateCalculation: DateTime.now().toString(),
      method: "Saturação por bases",
      idMethod: 3,
      calciteLimestone: calciteLimestone,
      dolomiticLimestone: dolomiticLimestone,
      prntCalcite: prntCalcite,
      prntDolomitic: prntDolomitic,
      elevaCa: 0.0,
      elevaMg: 0.0,
      calCaO: 0.0,
      calMgO: 0.0,
      dolCaO: 0.0,
      dolMgO: 0.0,
      desiredPH: 0,
      soilType: "0",
    );
  }

  /// #### 4 #### MÉTODO SMP
  ResultLiming smp({required SoilAnalysis soilAnalysis, required double prntCalcite, required double prntDolomitic, required double desiredPH}) {
    double calciteLimestone = 0.0;
    double dolomiticLimestone = 0.0;

    double Ca = double.parse(soilAnalysis.ca.toString());
    double Mg = double.parse(soilAnalysis.mg.toString());
    double CaMg = Ca / Mg;
    double PRNT;
    double NC = 0.0;

    for (int i = 0; i < SMP().tableSMP.length; i++) {
      List line = SMP().tableSMP[i];
      if (double.parse(soilAnalysis.pH.toStringAsPrecision(2)) == line[0]) {
        if (desiredPH == 5.5) {
          NC = line[1] * 1000;
          print("dose: " + NC.toString() + " kg/ha");
        } else if (desiredPH == 6.0) {
          NC = line[2] * 1000;
          print("dose: " + NC.toString() + " kg/ha");
        } else if (desiredPH == 6.5) {
          NC = line[3] * 1000;
          print("dose: " + NC.toString() + " kg/ha");
        }
      }
    }

    if (CaMg < 4.0) {
      PRNT = prntCalcite;
    } else {
      PRNT = prntDolomitic;
    }

    if (CaMg < 4.0) {
      calciteLimestone = (NC * 100) / prntCalcite;
    } else {
      dolomiticLimestone = (NC * 100) / prntDolomitic;
    }
    return ResultLiming(
      uid: soilAnalysis.uuid,
      dateAnalysis: soilAnalysis.dataUpload.toString(),
      dateCalculation: DateTime.now().toString(),
      method: "Índice SMP\n(Shoemaker, Mac lean e Pratt)",
      idMethod: 4,
      calciteLimestone: calciteLimestone,
      dolomiticLimestone: dolomiticLimestone,
      prntCalcite: prntCalcite,
      prntDolomitic: prntDolomitic,
      elevaCa: 0.0,
      elevaMg: 0.0,
      calCaO: 0.0,
      calMgO: 0.0,
      dolCaO: 0.0,
      dolMgO: 0.0,
      desiredPH: desiredPH,
      soilType: "0",
    );
  }

  /// #### 5 #### MÉTODO ALUMINIO TROICÁVEL
  ResultLiming exchangeableAluminum(
      {required SoilAnalysis soilAnalysis, required double prntCalcite, required double prntDolomitic, required String soilType}) {
    double result = 0.0;
    if (soilType == "1") {
      result = double.parse(soilAnalysis.al.toString()) * 1.5 * 1000;
    } else if (soilType == "2") {
      result = double.parse(soilAnalysis.al.toString()) * 2 * 1000;
    } else {
      result = double.parse(soilAnalysis.al.toString()) * 2.4 * 1000;
    }
    double CaMg = double.parse(soilAnalysis.ca.toString()) / double.parse(soilAnalysis.mg.toString());
    double calciteLimestone = 0.0;
    double dolomiticLimestone = 0.0;
    if (CaMg < 4) {
      calciteLimestone = (result * 100) / prntCalcite;
    } else {
      dolomiticLimestone = (result * 100) / prntDolomitic;
    }
    return ResultLiming(
      uid: soilAnalysis.uuid,
      dateAnalysis: soilAnalysis.dataUpload.toString(),
      dateCalculation: DateTime.now().toString(),
      method: "Alumínio trocável",
      idMethod: 5,
      calciteLimestone: calciteLimestone,
      dolomiticLimestone: dolomiticLimestone,
      prntCalcite: prntCalcite,
      prntDolomitic: prntDolomitic,
      elevaCa: 0.0,
      elevaMg: 0.0,
      calCaO: 0.0,
      calMgO: 0.0,
      dolCaO: 0.0,
      dolMgO: 0.0,
      desiredPH: 0,
      soilType: soilType,
    );
  }

  double potassiumChloride({required SoilAnalysis soilAnalysis, required double elevaK}) {
    double ctc = soilAnalysis.ca + soilAnalysis.mg + soilAnalysis.k + soilAnalysis.hAl;

    double desirablePotassium = ctc * (elevaK / 100);
    double potassiumDeficiency = desirablePotassium - soilAnalysis.k;
    double potassiumDeficiency_kg_ha = potassiumDeficiency * 390.983 * 2;

    double total_kcl = (((potassiumDeficiency_kg_ha * 100) / 83.01513021) * 100) / 60;

    print(total_kcl);
    return total_kcl;
  }

  static LimestoneParticipation limestoneParticipation({
    required ResultLiming liming,
  }) {
    double totalCalCaO = liming.calciteLimestone! > 0 ? liming.calciteLimestone! * (liming.calCaO! / 100) : 0;
    double totalCalMgO = liming.calciteLimestone! > 0 ? liming.calciteLimestone! * (liming.calMgO! / 100) : 0;
    double totalDolCaO = liming.dolomiticLimestone! > 0 ? liming.dolomiticLimestone! * (liming.dolCaO! / 100) : 0;
    double totalDolMgo = liming.dolomiticLimestone! > 0 ? liming.dolomiticLimestone! * (liming.dolMgO! / 100) : 0;
    double totalK = liming.potassiumFertilization! > 0 ? liming.potassiumFertilization! * (83.01513021 / 100) * (60 / 100) : 0;

    double totalCalCa = totalCalCaO * (percent_Ca_CaO / 100);
    double totalCalMg = totalCalMgO * (percent_Mg_MgO / 100);
    double totalDolCa = totalDolCaO * (percent_Ca_CaO / 100);
    double totalDolMg = totalDolMgo * (percent_Mg_MgO / 100);

    double totalCa = totalCalCa + totalDolCa;
    double totalMg = totalCalMg + totalDolMg;

    double totalCa_mgdm3 = totalCa / 2;
    double totalMg_mgdm3 = totalMg / 2;
    double totalK_mgdm3 = totalK / 2;

    double totalCa_cmoldm3 = totalCa_mgdm3 / 200.39;
    double totalMg_cmoldm3 = totalMg_mgdm3 / 121.525;
    double totalK_cmoldm3 = totalK_mgdm3 / 390.983;

    return LimestoneParticipation(ca: totalCa_cmoldm3, mg: totalMg_cmoldm3, k: totalK_cmoldm3);
  }
}

class LimestoneParticipation {
  LimestoneParticipation({required this.ca, required this.mg, required this.k});

  final double ca;
  final double mg;
  final double k;
}
