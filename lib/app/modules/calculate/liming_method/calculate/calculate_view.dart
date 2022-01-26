import 'package:calagem_brasil_pro/app/data/extensions/app_double.dart';
import 'package:calagem_brasil_pro/app/data/model/analysis/SoilAnalysis.dart';
import 'package:calagem_brasil_pro/app/modules/config/config_view.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/composition/MyAppBar.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'calculate_controller.dart';

class CalculateView extends StatelessWidget {
  final SoilAnalysis soilAnalysis;
  final String method;

  const CalculateView({Key? key, required this.soilAnalysis, required this.method}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalculateController>(
        init: CalculateController(soilAnalysis, method),
        builder: (_) {
          return Scaffold(
            appBar: MyAppBar(
              title: Text(_.curentMethod(method)),
            ),
            floatingActionButton: FloatingActionButton.extended(
                onPressed: () => _.calculate(),
                backgroundColor: AppColors.tertiary,
                label: Row(
                  children: [
                    Icon(Icons.calculate),
                    SizedBox(width: Get.width * 0.05),
                    Text("Calcular"),
                  ],
                )),
            body: SingleChildScrollView(
              child: Container(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.fromLTRB(0, 0, 0, Get.width * 0.025),
                      color: AppColors.primary,
                      child: Center(
                        child: Text(
                          "Definições",
                          style: TextStyle(color: Colors.white, fontSize: Get.width * 0.045),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.width * 0.02),
                    Container(
                      width: Get.width,
                      child: Center(
                        child: Text("PRNT dos cálcarios"),
                      ),
                    ),
                    SizedBox(height: Get.width * 0.02),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.fromLTRB(Get.width * 0.05, 0, Get.width * 0.05, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width * 0.40,
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
                    if (method == "estequiometrico") ...[
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.fromLTRB(Get.width * 0.05, 0, Get.width * 0.05, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: Get.width * 0.05),
                            Text("Teores cálcario calcítico"),
                            SizedBox(height: Get.width * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: Get.width * 0.30,
                                  child: TextField(
                                    controller: _.controllerCalCaO,
                                    onChanged: (text) => _.refreshParticipation(),
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
                                    onChanged: (text) => _.refreshParticipation(),
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
                            Text("Teores cálcario dolomítico"),
                            SizedBox(height: Get.width * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: Get.width * 0.30,
                                  child: TextField(
                                    controller: _.controllerDolCaO,
                                    onChanged: (text) => _.refreshParticipation(),
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
                                    onChanged: (text) => _.refreshParticipation(),
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
                            Text("Participação desejada de cálcio na CTC"),
                            SizedBox(height: Get.width * 0.02),
                            Container(
                              width: Get.width * 0.30,
                              child: TextField(
                                controller: _.controllerCa,
                                onChanged: (text) => _.refreshParticipation(),
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
                                onChanged: (text) => _.refreshParticipation(),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Relação ",
                                  style: TextStyle(fontSize: Get.width * 0.045),
                                ),
                                Text(
                                  "Ca/Mg",
                                  style: TextStyle(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                                ),
                                Text(" atual", style: TextStyle(fontSize: Get.width * 0.045)),
                              ],
                            ),
                            Text(
                              _.relationSoil,
                              style: TextStyle(fontSize: Get.width * 0.08, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Get.width * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Relação ",
                                  style: TextStyle(fontSize: Get.width * 0.045),
                                ),
                                Text(
                                  "Ca/Mg",
                                  style: TextStyle(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                                ),
                                Text(" desejada", style: TextStyle(fontSize: Get.width * 0.045)),
                              ],
                            ),
                            Text(
                              _.relationCal,
                              style: TextStyle(fontSize: Get.width * 0.08, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                    if (method == "estequiometrico2") ...[
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.fromLTRB(Get.width * 0.05, 0, Get.width * 0.05, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: Get.width * 0.05),
                            Text("Teores cálcario calcítico"),
                            SizedBox(height: Get.width * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: Get.width * 0.30,
                                  child: TextField(
                                    controller: _.controllerCalCaO,
                                    onChanged: (text) => _.refreshParticipation(),
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
                                    onChanged: (text) => _.refreshParticipation(),
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
                            Text("Teores cálcario dolomítico"),
                            SizedBox(height: Get.width * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: Get.width * 0.30,
                                  child: TextField(
                                    controller: _.controllerDolCaO,
                                    onChanged: (text) => _.refreshParticipation(),
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
                                    onChanged: (text) => _.refreshParticipation(),
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
                            Text("Participação desejada de cálcio na CTC"),
                            SizedBox(height: Get.width * 0.02),
                            Container(
                              width: Get.width * 0.30,
                              child: TextField(
                                controller: _.controllerCa,
                                onChanged: (text) => _.refreshParticipation(),
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
                                onChanged: (text) => _.refreshParticipation(),
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
                                onChanged: (text) => _.refreshParticipation(),
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
                            SizedBox(height: Get.width * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Relação ",
                                  style: TextStyle(fontSize: Get.width * 0.045),
                                ),
                                Text(
                                  "Ca/Mg",
                                  style: TextStyle(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                                ),
                                Text(" atual", style: TextStyle(fontSize: Get.width * 0.045)),
                              ],
                            ),
                            Text(
                              _.relationSoil,
                              style: TextStyle(fontSize: Get.width * 0.08, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Get.width * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Relação ",
                                  style: TextStyle(fontSize: Get.width * 0.045),
                                ),
                                Text(
                                  "Ca/Mg",
                                  style: TextStyle(fontSize: Get.width * 0.06, fontWeight: FontWeight.bold),
                                ),
                                Text(" desejada", style: TextStyle(fontSize: Get.width * 0.045)),
                              ],
                            ),
                            Text(
                              _.relationCal,
                              style: TextStyle(fontSize: Get.width * 0.08, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                    if (method == "saturacao_bases") ...[
                      SizedBox(height: Get.width * 0.05),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.fromLTRB(Get.width * 0.05, 0, Get.width * 0.05, 0),
                        child: Row(
                          children: [
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
                    ],
                    if (method == "smp") ...[
                      Container(
                        padding: EdgeInsets.fromLTRB(Get.width * 0.05, 0, Get.width * 0.05, 0),
                        child: Column(
                          children: [
                            SizedBox(height: Get.width * 0.05),
                            Text("pH atual"),
                            Text(
                              "${double.parse(double.parse(_.soilAnalysis.pH.toString()).format_1().replaceAll(",", '.'))}",
                              style: TextStyle(fontSize: Get.width * 0.075),
                            ),
                            SizedBox(height: Get.width * 0.05),
                            Text("Informe o pH desejado"),
                            Container(
                              width: Get.width,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: _.pH55,
                                    onChanged: (value) => _.setpH(faixa: '5,5'),
                                  ),
                                  Text(
                                    " pH 5,5",
                                    style: TextStyle(
                                      fontSize: Get.width * 0.045,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: Get.width,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: _.pH6,
                                    onChanged: (value) => _.setpH(faixa: '6'),
                                  ),
                                  Text(
                                    " pH 6,0",
                                    style: TextStyle(
                                      fontSize: Get.width * 0.045,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: Get.width,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: _.pH65,
                                    onChanged: (value) => _.setpH(faixa: '6,5'),
                                  ),
                                  Text(
                                    " pH 6,5",
                                    style: TextStyle(
                                      fontSize: Get.width * 0.045,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    if (method == "aluminio_trocavel") ...[
                      SizedBox(height: Get.width * 0.05),
                      Container(
                        width: Get.width,
                        child: Column(
                          children: [
                            Text("Informe a textura e teor de matéria orgânica"),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Get.width * 0.02),
                        width: Get.width,
                        child: Row(
                          children: [
                            Checkbox(
                              value: _.soil1,
                              onChanged: (value) => _.setTypeSoil(soil: '1'),
                            ),
                            Text(
                              " - solo de textura arenosa (menos 15% argila)\n - baixo teor de matéria orgânica",
                              style: TextStyle(
                                fontSize: Get.width * 0.04,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Get.width * 0.03),
                        width: Get.width,
                        child: Row(
                          children: [
                            Checkbox(
                              value: _.soil2,
                              onChanged: (value) => _.setTypeSoil(soil: '2'),
                            ),
                            Text(
                              " - solo de textura média (15% a 35% argila)\n - teor médio de matéria orgânica",
                              style: TextStyle(
                                fontSize: Get.width * 0.04,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Get.width * 0.03),
                        width: Get.width,
                        child: Row(
                          children: [
                            Checkbox(
                              value: _.soil3,
                              onChanged: (value) => _.setTypeSoil(soil: '3'),
                            ),
                            Text(
                              "  - solo argiloso (mais 35% argila)\n - alto teor de matéria orgânica",
                              style: TextStyle(
                                fontSize: Get.width * 0.04,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                    InkWell(
                      onTap: () async {
                        var data = await Get.to(() => ConfigView());
                        if (data == null || data != null) {
                          _.returnStorageConfigValues();
                        }
                      },
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.all(Get.width * 0.05),
                        child: Text(
                          "Para alterar os valores pré-definidos, acesse a área padrões ou clique aqui.",
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: Get.width * 0.15),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
