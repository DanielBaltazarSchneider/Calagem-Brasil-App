import 'package:calagem_brasil_pro/app/data/extensions/app_date_time.dart';
import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/data/packages/database/tb_analises/tb_analise_v1.dart';
import 'package:calagem_brasil_pro/app/modules/analysis/new_analysis/new_analysis_view.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListAnalisysisController extends GetxController {
  TbAnaliseV1 tbAnalise = TbAnaliseV1();
  final db = GetStorage();
  List<SoilAnalysis> soilAnalysis = [];

  ScrollController scrollController = ScrollController();

  int selectedYear = 2021;
  int selectedMon = 6;

  String nome = "";

  int currentDay = 1;
  int lastDay = 1;
  int initialNumberAnalysis = -1;

  bool isLoading = false;

  ListAnalisysisController() {
    this.nome = db.read("user");
    //returnSoilAnalyses();
  }

  setScrollPosition() {
    scrollController.animateTo(
      returnSetPositionScroll(scrollController.position),
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  double returnSetPositionScroll(ScrollPosition scroll) {
    if (selectedMon == 1 || selectedMon == 2 || selectedMon == 3) {
      return scroll.minScrollExtent;
    } else if (selectedMon == 10 || selectedMon == 11 || selectedMon == 12) {
      return scroll.maxScrollExtent;
    } else {
      return (selectedMon * scroll.maxScrollExtent) / 12;
    }
  }

  void setMon(int _mon) {
    selectedMon = _mon;
    returnFilterDateSoilAnalyses();
    setScrollPosition();
  }

  void addYear() {
    selectedYear++;
    returnFilterDateSoilAnalyses();
  }

  void subtractYear() {
    selectedYear--;
    returnFilterDateSoilAnalyses();
  }

  returnSoilAnalyses() async {
    isLoading = true;
    update();
    soilAnalysis = [];
    soilAnalysis = await tbAnalise.select();
    print(soilAnalysis.length);
    soilAnalysis.sort((a, b) => b.dataUpload.compareTo(a.dataUpload));
    isLoading = false;
    update();
  }

  returnFilterDateSoilAnalyses() async {
    String dateSearchInit = "$selectedYear-${formatMon(selectedMon)}-01 00:00:00.000000";
    String dateSearchEnd = "$selectedYear-${formatMon(selectedMon)}-31 23:59:59.999999";
    isLoading = true;
    update();
    soilAnalysis = await tbAnalise.selectFilteredByData(DateTime.parse(dateSearchInit), DateTime.parse(dateSearchEnd));
    soilAnalysis.sort((a, b) => b.dataUpload.compareTo(a.dataUpload));
    isLoading = false;
    update();
  }

  alertDeleteAnalysis(SoilAnalysis soilAnalysis) {
    CoolAlert.show(
      context: Get.context!,
      type: CoolAlertType.confirm,
      title: "Remover análise?",
      onConfirmBtnTap: () {
        deleteSoilAnalysis(soilAnalysis);
        Get.back();
      },
    );
  }

  deleteSoilAnalysis(SoilAnalysis soilAnalysis) async {
    isLoading = true;
    update();
    bool data = await tbAnalise.delete(soilAnalysis);
    if (data) {
      returnFilterDateSoilAnalyses();
      isLoading = false;
      update();
    } else {
      Get.snackbar("Erro", "Não foi posível remover a análise", colorText: Colors.white, backgroundColor: Colors.red);
      isLoading = false;
      update();
    }
  }

  formatMon(_mon) {
    if (_mon < 10) {
      return "0$_mon";
    } else {
      return "$_mon";
    }
  }

  goToNewAnalysing() async {
    var callBack = await Get.to(() => NewAnalysisView());
    if (callBack == "Success") {
      returnSoilAnalyses();
    }
  }

  defineLastDate() {
    try {
      initialNumberAnalysis = soilAnalysis.length;
      selectedYear = int.parse(soilAnalysis[0].dataUpload.format_yyyy());
      selectedMon = int.parse(soilAnalysis[0].dataUpload.format_MM());
      update();
    } catch (err) {
      print(err);
      initialNumberAnalysis = 0;
      update();
    }
  }

  Widget MyDivider(SoilAnalysis _analysis, index) {
    currentDay = int.parse(_analysis.dataUpload.format_dd());
    if (index == 0) {
      lastDay = currentDay;
    }
    if (currentDay == lastDay) {
      // print("Atual " + currentDay.toString() + "              - $index");
      // print("Anterior " + lastDay.toString() + "           - $index");
      lastDay = currentDay;
      update();
      return Container();
    } else {
      lastDay = currentDay;
      update();
      return Divider(
        thickness: 2,
        color: AppColors.primary.withOpacity(0.5),
      );
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(Duration.zero, () async {
      returnSoilAnalyses();
    });
    var currentDate = DateTime.now();
    setMon(currentDate.month);
    selectedYear = currentDate.year;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
