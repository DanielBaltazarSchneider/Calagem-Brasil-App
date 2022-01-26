import 'package:calagem_brasil_pro/app/modules/analysis/new_analysis/new_analysis_controller.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/composition/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class NewAnalysisView extends StatelessWidget {
  const NewAnalysisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewAnalysisController>(
      init: NewAnalysisController(),
      builder: (_) {
        final cmol = Container(
          width: 100,
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [Text('cmol'), Text('c', style: TextStyle(fontSize: 10)), Text('/dm³')]),
        );
        return Scaffold(
          appBar: MyAppBar(
            title: Text("Nova análise"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(Get.width * 0.05),
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width * 0.9,
                    child: TextField(
                        controller: _.controllerClient, decoration: InputDecoration(labelText: "Cliente"), textCapitalization: TextCapitalization.sentences),
                  ),
                  SizedBox(height: Get.width * 0.025),
                  Container(
                    width: Get.width * 0.9,
                    child: TextField(
                        controller: _.controllerLocal, decoration: InputDecoration(labelText: "Local"), textCapitalization: TextCapitalization.sentences),
                  ),
                  SizedBox(height: Get.width * 0.025),
                  Container(
                    width: Get.width * 0.9,
                    child: TextField(
                      controller: _.controllerArea,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: "Área (ha)"),
                      onChanged: (text) {
                        if (text.contains(',')) {
                          _.controllerArea.text = _.convertComma(text);
                          _.controllerArea.selection = TextSelection.fromPosition(TextPosition(offset: _.controllerArea.text.length));
                          _.update();
                        }
                      },
                    ),
                  ),
                  SizedBox(height: Get.width * 0.025),
                  Container(
                    width: Get.width * 0.45,
                    child: TextField(
                        controller: _.controllerphWater,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(labelText: "pH (em água)"),
                        onChanged: (text) {
                          if (text.contains(',')) {
                            _.controllerphWater.text = _.convertComma(text);
                            _.controllerphWater.selection = TextSelection.fromPosition(TextPosition(offset: _.controllerphWater.text.length));
                            _.update();
                          }
                        }),
                  ),
                  SizedBox(height: Get.width * 0.025),
                  Container(
                    width: Get.width * 0.45,
                    child: TextField(
                        controller: _.controllerHAl,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(labelText: "H + Al (acidez potencial)", suffix: cmol),
                        onChanged: (text) {
                          if (text.contains(',')) {
                            _.controllerHAl.text = _.convertComma(text);
                            _.controllerHAl.selection = TextSelection.fromPosition(TextPosition(offset: _.controllerHAl.text.length));
                            _.update();
                          }
                        }),
                  ),
                  SizedBox(height: Get.width * 0.025),
                  Container(
                    width: Get.width * 0.45,
                    child: TextField(
                        controller: _.controllerAl,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(labelText: "Al (Alumínio)", suffix: cmol),
                        onChanged: (text) {
                          if (text.contains(',')) {
                            _.controllerAl.text = _.convertComma(text);
                            _.controllerAl.selection = TextSelection.fromPosition(TextPosition(offset: _.controllerAl.text.length));
                            _.update();
                          }
                        }),
                  ),
                  SizedBox(height: Get.width * 0.025),
                  Container(
                    width: Get.width * 0.45,
                    child: TextField(
                        controller: _.controllerCa,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(labelText: "Ca (cálcio)", suffix: cmol),
                        onChanged: (text) {
                          if (text.contains(',')) {
                            _.controllerCa.text = _.convertComma(text);
                            _.controllerCa.selection = TextSelection.fromPosition(TextPosition(offset: _.controllerCa.text.length));
                            _.update();
                          }
                        }),
                  ),
                  SizedBox(height: Get.width * 0.025),
                  Container(
                    width: Get.width * 0.45,
                    child: TextField(
                        controller: _.controllerMg,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(labelText: "Mg (magnésio)", suffix: cmol),
                        onChanged: (text) {
                          if (text.contains(',')) {
                            _.controllerMg.text = _.convertComma(text);
                            _.controllerMg.selection = TextSelection.fromPosition(TextPosition(offset: _.controllerMg.text.length));
                            _.update();
                          }
                        }),
                  ),
                  SizedBox(height: Get.width * 0.025),
                  Container(
                    width: Get.width * 0.45,
                    child: TextField(
                        controller: _.controllerK,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(labelText: "K (potássio)", suffix: cmol),
                        onChanged: (text) {
                          if (text.contains(',')) {
                            _.controllerK.text = _.convertComma(text);
                            _.controllerK.selection = TextSelection.fromPosition(TextPosition(offset: _.controllerK.text.length));
                            _.update();
                          }
                        }),
                  ),
                  SizedBox(height: Get.width * 0.025),
                  Container(
                    width: Get.width * 0.45,
                    child: TextField(
                        controller: _.controllerNa,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(labelText: "Na (sódio)", suffix: cmol),
                        onChanged: (text) {
                          if (text.contains(',')) {
                            _.controllerNa.text = _.convertComma(text);
                            _.controllerNa.selection = TextSelection.fromPosition(TextPosition(offset: _.controllerNa.text.length));
                            _.update();
                          }
                        }),
                  ),
                  SizedBox(height: Get.width * 0.025),
                  TextButton(
                    onPressed: () => _.createRecord(),
                    child: Text("Salvar"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
