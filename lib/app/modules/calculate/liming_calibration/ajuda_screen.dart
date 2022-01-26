import 'package:flutter/material.dart';

class AjudaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final availableWidth = MediaQuery.of(context).size.width;
    final sizedProject = availableWidth / 16;
    final appBar = AppBar(
      title: Text('Ajuda'),
      elevation: 0,
      centerTitle: true,
    );
    final availableHeight = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(availableWidth * 0.035),
          child: Column(
            children: [
              Text(
                '         Para a realização do cálculo de calibração não é obrigatório o preenchimento de todos os campos, porém é obrigatório fornecer os valores da dosagem de calcário (kg/ha) e a faixa de aplicação (m). ',
                style: TextStyle(
                  fontSize: sizedProject * 0.73,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 15),
              Text(
                'Obrigatoriamente deve se optar pelo fornecimento da distância de deslocamento (m) e do tempo de deslocamento (s) ou pelo fornecimento da velocidade de deslocamento (km/h).',
                style: TextStyle(
                  fontSize: sizedProject * 0.73,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 15),
              Text(
                'A calculadora também é capaz de determinar a velocidade de trabalho ideal em relação a quantidade de calcário coletado em um período de tempo.',
                style: TextStyle(
                  fontSize: sizedProject * 0.73,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
