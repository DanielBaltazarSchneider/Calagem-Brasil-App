import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../ajuda_screen.dart';
import 'controller_calibracao_total.dart';

class CalibrationTotalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final availableWidth = MediaQuery.of(context).size.width;
    final sizedProject = availableWidth / 16;
    final appBar = AppBar(
      title: Text('Calibração'),
      elevation: 0,
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.help,
            color: Colors.white,
          ),
          onPressed: () {
            Get.to(AjudaScreen());
          },
        ),
      ],
    );
    final availableHeight = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    var f = NumberFormat('#,##0.##', 'pt_BR');

    return GetBuilder<ControllerCalibracaoTotal>(
        init: ControllerCalibracaoTotal(),
        builder: (calibracao) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar,
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Divider(),
                    Container(
                      child: Text(
                        'Informe os dados'.toUpperCase(),
                        style: TextStyle(
                          fontSize: sizedProject * 0.75,
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      width: availableWidth * 0.95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: availableWidth * 0.3,
                            child: TextField(
                              controller: calibracao.controllerDistancia,
                              onChanged: (_) {
                                calibracao.calculaVelocidade();
                              },
                              decoration: InputDecoration(
                                labelText: 'Distância',
                                suffixText: 'm',
                                contentPadding: EdgeInsets.fromLTRB(sizedProject * 0.85, 0, sizedProject * 0.85, 0),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                            ),
                          ),
                          Container(
                            width: availableWidth * 0.25,
                            child: TextField(
                              controller: calibracao.controllerTempo,
                              onChanged: (_) {
                                calibracao.calculaVelocidade();
                              },
                              decoration: InputDecoration(
                                labelText: 'Tempo',
                                suffixText: 's',
                                labelStyle: TextStyle(color: Colors.orange),
                                contentPadding: EdgeInsets.fromLTRB(sizedProject * 0.85, 0, sizedProject * 0.85, 0),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                            ),
                          ),
                          Container(
                            width: availableWidth * 0.35,
                            child: TextField(
                              controller: calibracao.controllerVelocidade,
                              onChanged: (_) {
                                calibracao.calculaTempoDistancia();
                              },
                              decoration: InputDecoration(
                                labelText: 'Velocidade',
                                suffixText: 'km/h',

                                contentPadding: EdgeInsets.fromLTRB(sizedProject * 0.85, 0, sizedProject * 0.85, 0),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: availableWidth * 0.95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: availableWidth * 0.55,
                            child: TextField(
                              controller: calibracao.controllerDosagem,
                              onChanged: (_) {
                                calibracao.verificaCalculo();
                              },
                              decoration: InputDecoration(
                                labelText: 'Dosagem',
                                suffixText: 'kg/ha',
                                labelStyle: TextStyle(color: Colors.orange),
                                contentPadding: EdgeInsets.fromLTRB(sizedProject * 0.85, 0, sizedProject * 0.85, 0),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                            ),
                          ),
                          Container(
                            width: availableWidth * 0.35,
                            child: TextField(
                              controller: calibracao.controllerFaixa,
                              onChanged: (_) {
                                calibracao.verificaCalculo();
                              },
                              decoration: InputDecoration(
                                labelText: 'Faixa',
                                suffixText: 'm',
                                labelStyle: TextStyle(color: Colors.orange),
                                contentPadding: EdgeInsets.fromLTRB(sizedProject * 0.85, 0, sizedProject * 0.85, 0),
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: availableWidth * 0.95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: availableWidth * 0.95,
                            child: TextField(
                              onChanged: (_) {
                                calibracao.defineVelocidadeColetado();
                              },
                              controller: calibracao.controllerPesoColeta,
                              decoration: InputDecoration(
                                labelText: 'Peso coletado ou a ser coletado',
                                suffixText: 'Kg',
                                contentPadding: EdgeInsets.fromLTRB(sizedProject * 0.85, 0, sizedProject * 0.85, 0),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: availableWidth,
                          padding: EdgeInsets.all(availableHeight * 0.02),
                          child: Image.asset(
                            'assets/images/trator.jpg',
                          ),
                        ),
                        Positioned(
                          top: availableWidth * 0.025,
                          left: availableWidth * 0.025,
                          child: Column(
                            children: [
                              Text('Velocidade'),
                              Text(
                                '${f.format(calibracao.velocidade)} km/h',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: availableWidth * 0.025,
                          right: availableWidth * 0.025,
                          child: Column(
                            children: [
                              Text('Dosagem'),
                              Text(
                                '${f.format(calibracao.dosagem)} kg/ha',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: availableWidth * 0.025,
                          left: availableWidth * 0.025,
                          child: Column(
                            children: [
                              Text('Faixa de aplicação'),
                              Text(
                                '${f.format(calibracao.faixa)} m',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    if (calibracao.velocidade > 0 && calibracao.tempo > 0 && calibracao.pesoColeta > 0 && calibracao.dosagem > 0 && calibracao.faixa > 0)
                      Container(
                        width: availableWidth,
                        child: Column(
                          children: [
                            Divider(),
                            Text(
                              'Recomendação',
                              style: TextStyle(
                                fontSize: sizedProject * 0.85,
                              ),
                            ),
                            Divider(),
                            if (calibracao.exibeNormal)
                              Container(
                                width: availableWidth * 0.9,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Para a velocidade de ${f.format(calibracao.velocidade)} km/h, faixa de aplicação de ${f.format(calibracao.faixa)} m e dosagem de ${f.format(calibracao.dosagem)} kh/ha',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: sizedProject * 0.65,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: Text(
                                        'Deve se coletar ${f.format(calibracao.pesoColeta)} kg de calcário em ${f.format(calibracao.tempo)}s',
                                        style: TextStyle(
                                          fontSize: sizedProject * 0.85,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            /*
                          ### A partir do peso coletado
                           */
                            if (calibracao.exibePelaAmostra)
                              Container(
                                width: availableWidth * 0.9,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'A partir do peso coletado de ${f.format(calibracao.pesoColeta)} kg, faixa de aplicação de ${f.format(calibracao.faixa)} m, dosagem de ${f.format(calibracao.dosagem)} kg/ha e tempo de coleta de ${f.format(calibracao.tempo)}s',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: sizedProject * 0.65,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: Text(
                                        'Deve se realizar a aplicação na velocidade de ${f.format(calibracao.velocidade)} km/h',
                                        style: TextStyle(
                                          fontSize: sizedProject * 0.85,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    Divider(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
