import 'package:calagem_brasil_pro/app/data/extensions/app_double.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardNutrient extends StatelessWidget {
  const CardNutrient({Key? key, required this.element, required this.value, required this.abbreviation, this.isElement = true}) : super(key: key);

  final String element;
  final double value;
  final String abbreviation;
  final bool isElement;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          "$abbreviation",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "$element",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: Get.width * 0.03),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "${value.format_2()}",
                      style: TextStyle(fontSize: Get.width * 0.055, fontWeight: FontWeight.bold),
                    ),
                    if (isElement) Text("cmolc/dm³"),
                  ],
                ),
              ),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}
