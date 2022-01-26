import 'package:calagem_brasil_pro/app/data/extensions/app_double.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartEscale extends StatelessWidget {
  final String? titleText;
  final double curentValue;
  final double maxEscale;
  final double minEscale;
  final double limitMaxEscale;
  final double limitMinEscale;
  final double intervalScale;
  final List<Widget>? title;

  const ChartEscale(
      {Key? key,
      this.titleText = "",
      required this.curentValue,
      required this.maxEscale,
      required this.minEscale,
      required this.limitMaxEscale,
      required this.limitMinEscale,
      required this.intervalScale,
      this.title = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (titleText != "") Text("$titleText (${minEscale.format_2()} - ${maxEscale.format_2()})"),
        if (titleText == "") ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < title!.length; i++) ...[
                title![i],
              ],
              Text("$titleText (${minEscale.format_2()} - ${maxEscale.format_2()})")
            ],
          ),
        ],
        SizedBox(height: Get.width * 0.01),
        Container(
          width: Get.width,
          height: 90,
          child: Stack(
            children: [
              Positioned(
                top: 28,
                child: Container(
                  margin: EdgeInsets.only(left: Get.width * 0.025),
                  width: Get.width * 0.95,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        if (maxEscale == 5 && minEscale == 3 && limitMaxEscale == 8) ...[
                          Colors.red,
                          Colors.red,
                          Colors.yellow,
                          Colors.green,
                          Colors.yellow,
                          Colors.red,
                          Colors.red,
                        ],
                        if (maxEscale == 16 && minEscale == 8) ...[
                          Colors.red,
                          Colors.red,
                          Colors.yellow,
                          Colors.green,
                          Colors.green,
                          Colors.yellow,
                          Colors.red,
                          Colors.red,
                        ],
                        if (maxEscale == 6 && minEscale == 3) ...[
                          Colors.red,
                          Colors.yellow,
                          Colors.green,
                          Colors.yellow,
                          Colors.red,
                        ],
                        if (maxEscale == 25 && minEscale == 17) ...[
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.yellow,
                          Colors.green,
                          Colors.yellow,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                        ],
                        if (maxEscale == 0.20 && minEscale == 0.13) ...[
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.yellow,
                          Colors.yellow,
                          Colors.green,
                          Colors.green,
                          Colors.yellow,
                          Colors.yellow,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                        ],
                        if (maxEscale == 25 && minEscale == 10) ...[
                          Colors.red,
                          Colors.red,
                          Colors.yellow,
                          Colors.green,
                          Colors.green,
                          Colors.yellow,
                          Colors.red,
                          Colors.red,
                        ],
                        if (maxEscale == 75 && minEscale == 65) ...[
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.yellow,
                          Colors.yellow,
                          Colors.green,
                          Colors.yellow,
                          Colors.yellow,
                          Colors.red,
                          Colors.red,
                        ],
                        if (maxEscale == 65 && minEscale == 50) ...[
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.yellow,
                          Colors.yellow,
                          Colors.yellow,
                          Colors.lime,
                          Colors.green,
                          Colors.green,
                          Colors.lime,
                          Colors.yellow,
                          Colors.yellow,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                        ],
                        if (maxEscale == 20 && minEscale == 10) ...[
                          Colors.red,
                          Colors.red,
                          Colors.yellow,
                          Colors.green,
                          Colors.yellow,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                        ],
                        if (maxEscale == 5 && minEscale == 3 && limitMaxEscale == 15) ...[
                          Colors.red,
                          Colors.red,
                          Colors.yellow,
                          Colors.green,
                          Colors.yellow,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                          Colors.red,
                        ],
                      ],
                    ),
                  ),
                  child: curentValue > limitMaxEscale
                      ? Center(
                          child: Text(
                            "Valor fora da escala - ${curentValue.format_2()}",
                            style: TextStyle(
                              fontSize: Get.width * 0.035,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        )
                      : Container(),
                ),
              ),
              Positioned(
                top: 26,
                child: Container(
                  margin: EdgeInsets.only(left: Get.width * 0.025),
                  width: Get.width * 0.95,
                  height: 2,
                  color: Colors.black,
                ),
              ),
              Positioned(
                top: 20,
                left: 0,
                child: Container(
                  margin: EdgeInsets.only(left: Get.width * 0.025, right: Get.width * 0.025),
                  width: Get.width * 0.95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (double i = limitMinEscale; i <= limitMaxEscale; i = i + intervalScale)
                        Container(
                          height: 8,
                          width: 2,
                          color: Colors.black,
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: Get.width * 0.017, right: Get.width * 0.017),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (double i = limitMinEscale; i <= limitMaxEscale; i = i + intervalScale) ...[
                      Text(
                        i.format_2(),
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ],
                ),
              ),
              Positioned(
                left: (curentValue * Get.width * 0.95) / (limitMaxEscale - limitMinEscale),
                top: 28,
                child: Container(
                  width: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/arrow.png',
                        width: 10,
                        height: 25,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        "${curentValue.format_200()}",
                        style: TextStyle(fontSize: Get.width * 0.022),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
