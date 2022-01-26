import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

import 'controller_resultado_bandeja.dart';

class ResultBandejaView extends StatelessWidget {
  double? largura;
  double? comprimento;
  double? velocidade;
  double? dosagem;
  List<double> listPesos;

  ResultBandejaView({this.largura, this.comprimento, this.velocidade, this.dosagem, this.listPesos = const []});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerResultBandeja>(
        init: ControllerResultBandeja(
          comprimento: comprimento,
          largura: largura,
          dosagem: dosagem,
          listPesos: listPesos,
          velocidade: velocidade,
        ),
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Resultado'),
              centerTitle: true,
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _.sharedScreen();
                    }),
              ],
            ),
            body: SingleChildScrollView(
              child: Screenshot(
                controller: _.screenshotController,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(Get.width * 0.025),
                  width: Get.width,
                  child: Column(
                    children: [
                      Text(
                        'RELATÓRIO',
                        style: TextStyle(
                          fontSize: Get.width / 16 * 0.8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Calagem Brasil',
                        style: TextStyle(
                          fontSize: Get.width / 16 * 0.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Get.width / 16 * 0.2),
                      Container(
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dosagem atual',
                              style: TextStyle(
                                fontSize: Get.width / 16 * 0.7,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${NumberFormat('#,###.##', 'pt_BR').format(_.dosagemAtual)} kg/ha',
                              style: TextStyle(
                                fontSize: Get.width / 16 * 1.2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (dosagem != 0) ...[
                        SizedBox(
                          height: Get.width / 16 * 0.2,
                        ),
                        Container(
                          width: Get.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dosagem pretendida',
                                style: TextStyle(
                                  fontSize: Get.width / 16 * 0.7,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800],
                                ),
                              ),
                              Text(
                                '${NumberFormat('#,###.##', 'pt_BR').format(_.dosagem)} kg/ha',
                                style: TextStyle(
                                  fontSize: Get.width / 16 * 1.2,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (dosagem != 0) ...[
                        SizedBox(
                          height: Get.width / 16 * 0.2,
                        ),
                        Container(
                          width: Get.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Diferença',
                                style: TextStyle(
                                  fontSize: Get.width / 16 * 0.7,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                '${NumberFormat('#,###.##', 'pt_BR').format(_.diferenca)} kg/ha',
                                style: TextStyle(
                                  fontSize: Get.width / 16 * 1.1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.warning,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: Get.width * 0.05),
                                  if (_.diferenca! > 0)
                                    Text(
                                      'Excesso de ${NumberFormat('#,###.##', 'pt_BR').format(_.diferenca)} kg/ha',
                                      style: TextStyle(
                                        fontSize: Get.width / 16 * 0.7,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  if (_.diferenca! < 0)
                                    Text(
                                      ' Insuficiência de ${NumberFormat('#,###.##', 'pt_BR').format(_.diferenca).replaceAll('-', '')} kg/ha',
                                      style: TextStyle(
                                        fontSize: Get.width / 16 * 0.7,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (dosagem! > 0 && velocidade! > 0) ...[
                        Divider(
                          height: Get.width / 16 * 0.5,
                          thickness: 3,
                          color: Colors.green,
                        ),
                        Container(
                          width: Get.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ajuste de velocidade',
                                style: TextStyle(
                                  fontSize: Get.width / 16 * 0.8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${NumberFormat('#,###.##', 'pt_BR').format(_.velocidadeIdeal)} km/h',
                                style: TextStyle(
                                  fontSize: Get.width / 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: Get.width * 0.02),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ajustando a velocidade de aplicação',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: Get.width / 16 * 0.7,
                                    ),
                                  ),
                                  Text(
                                    'de ${NumberFormat('#,###.##', 'pt_BR').format(_.velocidade)} km/h ',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: Get.width / 16 * 0.8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'para ${NumberFormat('#,###.##', 'pt_BR').format(_.velocidadeIdeal)} km/h ',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: Get.width / 16 * 0.8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'conseguirá manter a taxa de aplicação em ',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: Get.width / 16 * 0.7,
                                    ),
                                  ),
                                  Text(
                                    '${NumberFormat('#,###.##', 'pt_BR').format(_.dosagem).replaceAll('-', '')} kg/ha',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: Get.width / 16 * 0.8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: Get.width / 16 * 0.5,
                          thickness: 3,
                          color: Colors.green,
                        ),
                        Text(
                          'OU',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          height: Get.width / 16 * 0.5,
                          thickness: 3,
                          color: Colors.green,
                        ),
                        Container(
                          width: Get.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ajuste de proporção',
                                style: TextStyle(
                                  fontSize: Get.width / 16 * 0.75,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${NumberFormat('#,###.##', 'pt_BR').format(_.porcentagem)} %',
                                style: TextStyle(
                                  fontSize: Get.width / 16 * 0.85,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: Get.width * 0.02),
                              if (_.dosagemAtual! > dosagem!)
                                Text(
                                  'Realizando a redução na abertura do equipamento em: ',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: Get.width / 16 * 0.7,
                                  ),
                                ),
                              if (_.dosagemAtual! < dosagem!)
                                Text(
                                  'Realizando a abertura do equipamento em: ',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: Get.width / 16 * 0.7,
                                  ),
                                ),
                              Text(
                                '${NumberFormat('#,###.##', 'pt_BR').format(_.porcentagem)} %',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: Get.width / 16 * 0.7,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'conseguirá manter a taxa de aplicação em:  ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: Get.width / 16 * 0.7,
                                ),
                              ),
                              Text(
                                '${NumberFormat('#,###.#', 'pt_BR').format(_.dosagem).replaceAll('-', '')} kg/ha',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: Get.width / 16 * 0.7,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                      // if (_.imageFile != null) Image.file(_.imageFile),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
