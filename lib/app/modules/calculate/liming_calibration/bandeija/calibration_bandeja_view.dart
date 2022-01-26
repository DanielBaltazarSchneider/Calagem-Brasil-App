import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'calibration_bandeja_controller.dart';

class CalibrationBandejaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizedProject = Get.width / 16;
    return GetBuilder<ControllerCalibrationBandeja>(
        init: ControllerCalibrationBandeja(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Bandejas'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                width: Get.width,
                padding: EdgeInsets.only(
                  left: Get.width * 0.025,
                  right: Get.width * 0.025,
                  bottom: Get.width * 0.025,
                ),
                child: Theme(
                  data: ThemeData(primaryColor: Colors.black),
                  child: Column(
                    children: [
                      // Container(
                      //   width: Get.width,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     children: [
                      //       RaisedButton(
                      //         child: Text(
                      //           'Instruções',
                      //           style: TextStyle(
                      //             color: Colors.white,
                      //           ),
                      //         ),
                      //         onPressed: () {},
                      //         color: Theme.of(context).primaryColor,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(),
                        child: Column(
                          children: [
                            Divider(),
                            Text(
                              'Dados das bandejas',
                              style: TextStyle(fontSize: sizedProject * 0.75),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: sizedProject * 0.25),
                                      child: Text('Largura (cm)*'),
                                    ),
                                    Container(
                                      width: Get.width * 0.40,
                                      child: TextField(
                                        controller: _.controllerLargura,
                                        keyboardType: TextInputType.number,
                                        onChanged: (newValue) => _.changeValues(),
                                        style: TextStyle(fontSize: sizedProject * 0.75),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            left: Get.width * 0.05,
                                          ),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: sizedProject * 0.25),
                                      child: Text('Comprimento (cm)*'),
                                    ),
                                    Container(
                                      width: Get.width * 0.40,
                                      child: TextField(
                                        controller: _.controllerComprimento,
                                        onChanged: (newValue) => _.changeValues(),
                                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                                        style: TextStyle(fontSize: sizedProject * 0.75),
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: Get.width * 0.05),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Text(
                        'Dados do equipamento',
                        style: TextStyle(fontSize: sizedProject * 0.75),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: sizedProject * 0.25),
                                child: Text('Velocidade (km/h)'),
                              ),
                              Container(
                                width: Get.width * 0.40,
                                child: TextField(
                                  controller: _.controllerVelocidade,
                                  onChanged: (newValue) => _.changeValues(),
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: sizedProject * 0.75),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: Get.width * 0.05,
                                    ),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: sizedProject * 0.25),
                                child: Text('Dosagem (kg/ha)'),
                              ),
                              Container(
                                width: Get.width * 0.40,
                                child: TextField(
                                  controller: _.controllerDosagem,
                                  onChanged: (newValue) => _.changeValues(),
                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                  style: TextStyle(fontSize: sizedProject * 0.75),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: Get.width * 0.05),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: sizedProject * 2),
                      Stack(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/bandeja.png',
                              ),
                            ],
                          ),
                          Positioned(
                            left: Get.width * 0.2,
                            child: Transform.rotate(
                              angle: -0.3,
                              child: _.controllerComprimento.text != ''
                                  ? Text(
                                      '${_.controllerComprimento.text} cm',
                                      style: TextStyle(
                                        fontSize: sizedProject * 0.75,
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                          Positioned(
                            right: Get.width * 0.1,
                            child: Transform.rotate(
                              angle: 0.3,
                              child: _.controllerLargura.text != ""
                                  ? Text(
                                      '${_.controllerLargura.text} cm',
                                      style: TextStyle(
                                        fontSize: sizedProject * 0.75,
                                      ),
                                    )
                                  : Container(),
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Text('Peso coletado por bandeja (g)*'),
                      Divider(),
                      if (_.listPeso.length > 0)
                        Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    color: Colors.green,
                                    width: Get.width * 0.3,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: sizedProject * 0.25, bottom: sizedProject * 0.25),
                                        child: Text(
                                          'Bandeja',
                                          style: TextStyle(
                                            fontSize: sizedProject * 0.75,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.green,
                                    width: Get.width * 0.3,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: sizedProject * 0.25, bottom: sizedProject * 0.25),
                                        child: Text(
                                          'peso',
                                          style: TextStyle(
                                            fontSize: sizedProject * 0.75,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.green,
                                    width: Get.width * 0.3,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: sizedProject * 0.25, bottom: sizedProject * 0.25),
                                        child: Text(
                                          "Excluir",
                                          style: TextStyle(
                                            fontSize: sizedProject * 0.75,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              /*
                                #########
                                 */
                              for (int i = 0; i < _.listPeso.length; i++)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: Get.width * 0.3,
                                      child: Center(
                                        child: Text(
                                          'Bandeja ${i + 1}',
                                          style: TextStyle(
                                            fontSize: sizedProject * 0.6,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width * 0.3,
                                      child: Center(
                                        child: Text(
                                          '${NumberFormat('###.##', 'pt_BR').format(_.listPeso[i])} g',
                                          style: TextStyle(
                                            fontSize: sizedProject * 0.6,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width * 0.3,
                                      height: sizedProject * 1.1,
                                      child: Center(
                                        child: IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(
                                            Icons.delete_forever,
                                            size: sizedProject * 0.85,
                                          ),
                                          onPressed: () {
                                            _.removePeso(i);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      if (_.listPeso.length > 0) ...[
                        Divider(
                          height: sizedProject * 0.3,
                          color: Colors.green,
                          thickness: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: Get.width * 0.3,
                              child: Center(
                                child: Text(
                                  'Média',
                                  style: TextStyle(
                                    fontSize: sizedProject * 0.6,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: Get.width * 0.3,
                              child: Center(
                                child: Text(
                                  '${NumberFormat('###.##', 'pt_BR').format(_.listPeso.reduce((a, b) => a + b) / _.listPeso.length)} g',
                                  style: TextStyle(
                                    fontSize: sizedProject * 0.6,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: Get.width * 0.3,
                              height: sizedProject * 1.1,
                            ),
                          ],
                        ),
                        Divider(
                          height: sizedProject * 0.3,
                          color: Colors.green,
                          thickness: 3,
                        ),
                        SizedBox(
                          height: sizedProject,
                        ),
                      ],
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Bandeja ${_.listPeso.length + 1} -  '),
                              Container(
                                width: Get.width * 0.3,
                                child: TextField(
                                  controller: _.controllerPesoColetado,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                  decoration: InputDecoration(
                                      // border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(0)),
                                ),
                              ),
                              Text('g'),
                              Container(
                                child: RaisedButton(
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () {
                                    _.addPeso();
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.green,
                            height: sizedProject * 2,
                          ),
                        ],
                      ),
                      Divider(),
                      Container(
                        width: Get.width * 0.75,
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            'Calcular',
                            style: TextStyle(
                              fontSize: sizedProject * 0.75,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            _.irParaResultado();
                          },
                        ),
                      ),
                      SizedBox(height: sizedProject),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
