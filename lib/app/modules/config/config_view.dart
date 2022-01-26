import 'package:calagem_brasil_pro/app/modules/widgets/composition/MyAppBar.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'defaultconfig_controller.dart';

class ConfigView extends StatelessWidget {
  const ConfigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DefaultConfigController>(
        init: DefaultConfigController(),
        builder: (_) {
          return Scaffold(
            appBar: MyAppBar(
              title: Text("Padrões"),
            ),
            body: SingleChildScrollView(
              child: Container(
                width: Get.width,
                padding: EdgeInsets.fromLTRB(Get.width * 0.05, 0, Get.width * 0.05, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: Get.width * 0.05),
                    Text("PRNT dos cálcarios"),
                    SizedBox(height: Get.width * 0.02),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.fromLTRB(Get.width * 0.025, 0, Get.width * 0.025, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width * 0.4,
                            child: TextField(
                              controller: _.controllerPRNTcalcite,
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              decoration: InputDecoration(
                                labelText: "calcítico",
                                suffixText: "%",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.primary),
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width * 0.40,
                            child: TextField(
                              controller: _.controllerPRNTdolomitic,
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              decoration: InputDecoration(
                                labelText: "dolomítico",
                                suffixText: "%",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.primary),
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: AppColors.primary.withOpacity(0.5),
                      height: Get.width * 0.08,
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.fromLTRB(Get.width * 0.05, 0, Get.width * 0.05, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Para claculo de saturação de bases"),
                          SizedBox(height: Get.width * 0.02),
                          Container(
                            width: Get.width * 0.40,
                            child: TextField(
                              controller: _.controllerVpercent,
                              decoration: InputDecoration(
                                labelText: "V% desejada",
                                suffixText: "%",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.primary),
                                ),
                                contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: AppColors.primary.withOpacity(0.5),
                      height: Get.width * 0.08,
                    ),
                    Text("Participação desejada de cálcio na CTC"),
                    SizedBox(height: Get.width * 0.02),
                    Container(
                      width: Get.width * 0.30,
                      child: TextField(
                        controller: _.controllerCa,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          labelText: "%Ca",
                          suffixText: "%",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.width * 0.05),
                    Text("Participação desejada de magnésio na CTC"),
                    SizedBox(height: Get.width * 0.02),
                    Container(
                      width: Get.width * 0.30,
                      child: TextField(
                        controller: _.controllerMg,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          labelText: "%Mg",
                          suffixText: "%",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.width * 0.05),
                    Text("Participação desejada de potássio na CTC"),
                    SizedBox(height: Get.width * 0.02),
                    Container(
                      width: Get.width * 0.30,
                      child: TextField(
                        controller: _.controllerK,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          labelText: "%K",
                          suffixText: "%",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: AppColors.primary.withOpacity(0.5),
                      height: Get.width * 0.08,
                    ),
                    Text("Composição cálcario calcítico"),
                    SizedBox(height: Get.width * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: Get.width * 0.30,
                          child: TextField(
                            controller: _.controllerCalCaO,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              labelText: "%CaO",
                              suffixText: "%",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width * 0.30,
                          child: TextField(
                            controller: _.controllerCalMgO,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              labelText: "%MgO",
                              suffixText: "%",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.width * 0.05),
                    Text("Composição cálcario dolomítico"),
                    SizedBox(height: Get.width * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: Get.width * 0.30,
                          child: TextField(
                            controller: _.controllerDolCaO,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              labelText: "%CaO",
                              suffixText: "%",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width * 0.30,
                          child: TextField(
                            controller: _.controllerDolMgO,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              labelText: "%MgO",
                              suffixText: "%",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.width * 0.05),
                    Container(
                      width: Get.width * 0.7,
                      child: ElevatedButton(
                          onPressed: () => _.saveStorageValues(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.save),
                              SizedBox(width: Get.width * 0.05),
                              Text("Salvar"),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
