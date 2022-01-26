import 'package:calagem_brasil_pro/app/modules/calculate/liming_calibration/total/calibracao_total_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bandeija/calibration_bandeja_view.dart';

class TypeCalibrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final availableWidth = MediaQuery.of(context).size.width;
    final sizedProject = availableWidth / 16;
    final appBar = AppBar(
      title: Text('Métodos'),
      elevation: 0,
      centerTitle: true,
    );
    final availableHeight = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          height: availableHeight,
          width: availableWidth,
          child: Stack(
            children: [
              Container(
                height: availableWidth * 0.25,
                width: availableWidth,
                color: Theme.of(context).primaryColor,
              ),
              Positioned(
                top: availableHeight * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Get.to(CalibrationBandejaView());
                  },
                  child: Container(
                    width: availableWidth,
                    child: Center(
                      child: Container(
                        width: availableWidth * 0.75,
                        height: availableWidth * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(
                            availableWidth * 0.055,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Coleta com bandeja',
                                style: TextStyle(fontSize: sizedProject * 1.1),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Image.asset(
                              'assets/images/bandeja.png',
                              height: availableWidth * 0.2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: availableHeight * 0.5,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => CalibrationTotalView());
                  },
                  child: Container(
                    width: availableWidth,
                    child: Center(
                      child: Container(
                        width: availableWidth * 0.75,
                        height: availableWidth * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(
                            availableWidth * 0.055,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Coleta total',
                                style: TextStyle(fontSize: sizedProject * 1.1),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Image.asset(
                              'assets/images/distribuidor.png',
                              height: availableWidth * 0.25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
