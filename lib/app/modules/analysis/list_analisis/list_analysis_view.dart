import 'package:calagem_brasil_pro/app/data/functions/MyDateFormat.dart';
import 'package:calagem_brasil_pro/app/modules/analysis/view_analysis/analysis_view.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/CardAnalysis.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/LoadingBodyView.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/composition/MyAppBar.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_analysis_controller.dart';

class ListAnalysisView extends StatelessWidget {
  const ListAnalysisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListAnalisysisController>(
      init: ListAnalisysisController(),
      builder: (_) {
        final appBar = MyAppBar(
          title: Text("Análises"),
        );
        final height = Get.height - MediaQuery.of(context).padding.top - appBar.preferredSize.height;
        return Scaffold(
          backgroundColor: AppColors.primary,
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.tertiary,
            onPressed: () => _.goToNewAnalysing(),
            label: Row(
              children: [
                Icon(Icons.add),
                Text('análise'),
              ],
            ),
          ),
          appBar: appBar,
          body: _.initialNumberAnalysis == 0
              ? Container(
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        height: height * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                ": )",
                                style: TextStyle(fontSize: Get.width * 0.1, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            SizedBox(height: Get.width * 0.05),
                            Text(
                              "Cadastre sua primeira\nanálise de solo",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: Get.width * 0.065, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            SizedBox(height: Get.width * 0.2),
                            Transform(
                              transform: Matrix4.rotationZ(12.08),
                              child: Icon(
                                Icons.arrow_downward,
                                size: Get.width * 0.15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  color: Colors.white,
                  width: Get.width * 0.999,
                  child: Column(
                    children: [
                      Container(
                        //height: height * 0.15,
                        child: Column(
                          children: [
                            Container(
                              color: AppColors.primary,
                              width: Get.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () => _.subtractYear(),
                                    icon: Icon(Icons.arrow_left, color: Colors.white),
                                  ),
                                  Text(
                                    "${_.selectedYear}",
                                    style: TextStyle(color: Colors.white, fontSize: Get.width * 0.045),
                                  ),
                                  IconButton(
                                    onPressed: () => _.addYear(),
                                    icon: Icon(Icons.arrow_right, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: AppColors.primary,
                              padding: EdgeInsets.only(bottom: Get.width * 0.01),
                              width: Get.width,
                              child: SingleChildScrollView(
                                controller: _.scrollController,
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (int i = 1; i <= 12; i++) ...[
                                      GestureDetector(
                                        onTap: () => _.setMon(i),
                                        child: Container(
                                          padding: EdgeInsets.all(Get.width * 0.01),
                                          margin: EdgeInsets.only(
                                            left: Get.width * 0.025,
                                            right: Get.width * 0.025,
                                            top: Get.width * 0.01,
                                            bottom: Get.width * 0.01,
                                          ),
                                          width: Get.width * 0.12,
                                          height: Get.width * 0.12,
                                          decoration: BoxDecoration(
                                            color: _.selectedMon == i ? Colors.white : AppColors.primary,
                                            borderRadius: BorderRadius.circular(100),
                                            boxShadow: [
                                              BoxShadow(
                                                color: _.selectedMon == i ? AppColors.primary.withOpacity(0.1) : Colors.white.withOpacity(0.1),
                                                spreadRadius: 3,
                                                blurRadius: 1,
                                                // offset: Offset(0, 0), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: GetBuilder<ListAnalisysisController>(
                                              id: [""],
                                              builder: (_) {
                                                return Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      MyDateFormat.toMonthAbbreviation(i),
                                                      style: TextStyle(
                                                        color: _.selectedMon == i ? AppColors.primary : Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _.isLoading
                          ? LoadingBodyView(height: height * 0.8)
                          : Expanded(
                              child: Container(
                                color: Colors.white,
                                //height: height * 0.8,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      if (_.soilAnalysis.length == 0) ...[
                                        Container(
                                          color: Colors.white,
                                          height: height * 0.5,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              RotatedBox(
                                                quarterTurns: 1,
                                                child: Text(
                                                  ":(",
                                                  style: TextStyle(fontSize: Get.width * 0.1),
                                                ),
                                              ),
                                              SizedBox(height: Get.width * 0.05),
                                              Text(
                                                "Nenhuma análise salva\nno mês ${MyDateFormat.toCurrentMonth(_.selectedMon)} de ${_.selectedYear}",
                                                style: TextStyle(fontSize: Get.width * 0.05),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                      if (_.soilAnalysis.length > 0) ...[
                                        for (int i = 0; i < _.soilAnalysis.length; i++) ...[
                                          if (MyDateFormat.format_yyyy(_.soilAnalysis[i].dataUpload.toString()) == _.selectedYear.toString() &&
                                              int.parse(MyDateFormat.format_MM(_.soilAnalysis[i].dataUpload.toString())) == _.selectedMon) ...[
                                            _.MyDivider(_.soilAnalysis[i], i),
                                            Dismissible(
                                              key: ValueKey("d$i"),
                                              confirmDismiss: (state) async {
                                                _.alertDeleteAnalysis(_.soilAnalysis[i]);
                                              },
                                              background: Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Icon(
                                                      Icons.delete_forever,
                                                      color: Colors.red,
                                                      size: Get.width * 0.08,
                                                    ),
                                                    Icon(
                                                      Icons.delete_forever,
                                                      color: Colors.red,
                                                      size: Get.width * 0.08,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              child: GestureDetector(
                                                // onLongPress: () => _.alertDeleteAnalysis(_.soilAnalysis[i].doc.toString()),
                                                onTap: () => Get.to(
                                                  AnalysisView(
                                                    soilAnalysis: _.soilAnalysis[i],
                                                  ),
                                                ),
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: Get.width * 0.2,
                                                        child: Center(
                                                          child: Text(
                                                            MyDateFormat.format_dd(_.soilAnalysis[i].dataUpload.toString()),
                                                            style: TextStyle(
                                                              fontSize: Get.width * 0.06,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: Get.width * 0.75,
                                                        child: CardAnalysis(soilAnalysis: _.soilAnalysis[i]),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ],
                                      SizedBox(
                                        height: Get.height * 0.1,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
