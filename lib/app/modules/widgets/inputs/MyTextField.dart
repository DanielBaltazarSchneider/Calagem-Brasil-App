import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextField extends StatelessWidget {
  final width;
  final labelText;
  const MyTextField({Key? key, this.width, this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Get.width * 0.025, right: Get.width * 0.025),
      width: width,
      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(500)),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ],
      ),
    );
  }
}
