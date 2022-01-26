import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  String messageError = "";
  bool isLoading = false;

  void validateForm() {
    messageError = "";
    update();

    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(controllerEmail.text.trim());
    if (!emailValid) {
      print('invalid email');
      messageError = "email inválido \n";
      update();
    }
    if (controllerPassword.text.length < 6) {
      messageError += "senha inválida";
      update();
    }
    if (messageError == "") {
      newRegister(user: controllerEmail.text.trim(), password: controllerPassword.text.trim());
    }
  }

  void newRegister({required user, required password}) async {
    isLoading = true;
    update();
    // FirebaseResponse firebaseResponse = await FirebaseAuthentication().registerUserAuth(user, password, controllerName.text, controllerEmail.text);
    // if (firebaseResponse.status == true) {
    //   Get.back(result: 'register ok');
    // } else {
    //   messageError = firebaseResponse.message;
    //   update();
    // }
    isLoading = false;
    update();
  }
}
