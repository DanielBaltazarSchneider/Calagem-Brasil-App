import 'package:calagem_brasil_pro/app/data/extensions/app_date_time.dart';
import 'package:calagem_brasil_pro/app/data/extensions/app_double.dart';
import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/data/packages/database/tb_analises/tb_analise_v1.dart';
import 'package:calagem_brasil_pro/app/modules/analysis/view_analysis/analysis_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:range_calendar/range_calendar.dart';

class ScheduleController extends GetxController {
  TbAnaliseV1 tbAnalise = TbAnaliseV1();
  List<SoilAnalysis> listSoilAnalysis = [];
  Map<DateTime, List<Widget>> mapCalendar = {};
  Map<DateTime, List<Widget>> rangeMapCalendar = {};
  bool isLoading = false;
  DateTime dateSelected = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  CalendarRangeSelected rangeSelected = CalendarRangeSelected.day;
  List<SoilAnalysis> listAnalysisFilteredByRange = [];

  Future<void> returnSoilAnalyses() async {
    isLoading = true;
    update();
    listSoilAnalysis = [];
    listSoilAnalysis = await tbAnalise.select();
    print(listSoilAnalysis.length);
    listSoilAnalysis.sort((a, b) => b.dataUpload.compareTo(a.dataUpload));
    isLoading = false;
    update();
  }

  void generateMapCalendar() {
    for (SoilAnalysis analise in listSoilAnalysis) {
      if (mapCalendar.containsKey(convertDate(analise.dataUpload))) {
        mapCalendar[convertDate(analise.dataUpload)]!.add(generateWidgetItemAnalise(analise));
      } else {
        mapCalendar[convertDate(analise.dataUpload)] = [generateWidgetItemAnalise(analise)];
      }
    }
    update();
  }

  final nutrientLabelStyle = TextStyle(fontWeight: FontWeight.w600);
  final nutrientValueStyle = TextStyle(fontSize: Get.width * 0.04);

  Widget generateWidgetItemAnalise(SoilAnalysis analise) => Container(
        child: InkWell(
          onTap: () => precionou(analise),
          child: Card(
            child: Container(
              width: Get.width * 0.85,
              padding: EdgeInsets.all(Get.width * 0.025),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${analise.cliente}"),
                      Text("${analise.dataEdicao.format_dd_MM_yyyy()}"),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Ca", style: nutrientLabelStyle),
                          Text("${analise.ca.format_2()}", style: nutrientValueStyle),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Mg", style: nutrientLabelStyle),
                          Text("${analise.mg.format_2()}", style: nutrientValueStyle),
                        ],
                      ),
                      Column(
                        children: [
                          Text("K", style: nutrientLabelStyle),
                          Text("${analise.k.format_2()}", style: nutrientValueStyle),
                        ],
                      ),
                      Column(
                        children: [
                          Text("H+Al", style: nutrientLabelStyle),
                          Text("${analise.hAl.format_2()}", style: nutrientValueStyle),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void precionou(SoilAnalysis analise) {
    Get.to(() => AnalysisView(soilAnalysis: analise));
  }

  DateTime convertDate(DateTime _date) {
    return DateTime(_date.year, _date.month, _date.day);
  }

  Future<void> initController() async {
    await returnSoilAnalyses();
    generateMapCalendar();
    filterEventsRangeCalendar();
  }

  setDaySelected(DateTime _date) {
    dateSelected = _date;
    filterEventsRangeCalendar();
    update();
  }

  setRangeSelected(CalendarRangeSelected _range) {
    rangeSelected = _range;
    filterEventsRangeCalendar();
    update();
  }

  void filterEventsRangeCalendar() {
    if (rangeSelected == CalendarRangeSelected.day) {
      listAnalysisFilteredByRange = filterByDay();
      return;
    }
    if (rangeSelected == CalendarRangeSelected.week) {
      listAnalysisFilteredByRange = filterByWeek();
      return;
    }
    if (rangeSelected == CalendarRangeSelected.month) {
      listAnalysisFilteredByRange = filterByMonth();
      return;
    }
    listAnalysisFilteredByRange = [];
  }

  List<SoilAnalysis> filterByDay() {
    List<SoilAnalysis> _filtered = listSoilAnalysis.where((element) => validateDay(element)).toList();
    return _filtered;
  }

  List<SoilAnalysis> filterByWeek() {
    List<SoilAnalysis> _filtered = listSoilAnalysis.where((element) => validateWeek(element)).toList();
    return _filtered;
  }

  List<SoilAnalysis> filterByMonth() {
    List<SoilAnalysis> _filtered = listSoilAnalysis.where((element) => validateMonth(element)).toList();
    return _filtered;
  }

  bool validateDay(SoilAnalysis element) {
    return DateTime(element.dataUpload.year, element.dataUpload.month, element.dataUpload.day) == dateSelected;
  }

  bool validateWeek(SoilAnalysis element) {
    DateTime _testDate = DateTime(element.dataUpload.year, element.dataUpload.month, element.dataUpload.day);
    int dayWeek = dateSelected.weekday == 7 ? 1 : dateSelected.weekday + 1;
    DateTime _startWeek = dateSelected.add(Duration(days: -dayWeek));
    DateTime _endWeek = dateSelected.add(Duration(days: 6 - dayWeek));
    if (_testDate.isAfter(DateTime(_startWeek.year, _startWeek.month, _startWeek.day, 0, 0, 0)) &&
        _testDate.isBefore(DateTime(_endWeek.year, _endWeek.month, _endWeek.day, 23, 59, 99))) {
      return true;
    }
    return false;
  }

  bool validateMonth(SoilAnalysis element) {
    return true;
  }

  @override
  void onInit() {
    initController();
    super.onInit();
  }
}
