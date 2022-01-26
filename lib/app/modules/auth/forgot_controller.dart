import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController {
  final email;

  ForgotController({required this.email}) {
    controllerEmail.text = this.email;
  }

  bool isLoading = false;
  String messageError = "";

  TextEditingController controllerEmail = new TextEditingController();

  sendForgotPassword() async {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(controllerEmail.text.trim());
    if (!emailValid) {
      messageError = "email inválido";
      update();
    } else {
      // FirebaseResponse responseForgot = await FirebaseAuthentication().forgotPassword(controllerEmail.text.trim());
      // if (responseForgot.status) {
      //   Get.back(result: "email send");
      // } else {
      //   messageError = responseForgot.message;
      //   update();
      // }
    }
  }
}
