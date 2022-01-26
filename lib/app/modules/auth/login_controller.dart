import 'dart:async';
import 'dart:convert';

import 'package:calagem_brasil_pro/app/app_controller.dart';
import 'package:calagem_brasil_pro/app/data/model/communication/comunication.dart';
import 'package:calagem_brasil_pro/app/data/repository/authentication_repository/authentication_repository.dart';
import 'package:calagem_brasil_pro/app/data/repository/secure_storage_repository/secure_storage_repository.dart';
import 'package:calagem_brasil_pro/app/routes/app_pages.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_utils/keyboard_listener.dart' as keyboard_listener;
import 'package:keyboard_utils/keyboard_utils.dart';

class LoginController extends GetxController {
  KeyboardUtils _keyboardUtils = KeyboardUtils();
  late int _idKeyboardListener;

  bool isLoading = false;
  String messageError = "";

  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();

  int pageState = 0;

  var backgroundColor = Colors.white;
  var headingColor = Color(0xFFB40284A);

  double headingTop = 100;

  double loginWidth = 0;
  double loginHeight = 0;
  double loginOpacity = 1;

  double loginYOffset = 0;
  double loginXOffset = 0;
  double registerYOffset = 0;
  double registerHeight = 0;

  double forgotZOffset = 0;
  double forgotHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool keyboardVisible = false;

  void changeState() {
    windowHeight = Get.height;
    windowWidth = Get.width;

    loginHeight = windowHeight - 270;
    registerHeight = windowHeight - 270;

    print(pageState);
    switch (pageState) {
      case 0:
        backgroundColor = Colors.white;
        headingColor = Color(0xFFB40284A);

        headingTop = 100;

        loginWidth = windowWidth;
        loginOpacity = 1;

        loginYOffset = windowHeight;
        loginHeight = keyboardVisible ? windowHeight : windowHeight - 270;

        loginXOffset = 0;
        registerYOffset = windowHeight;
        update();
        break;
      case 1:
        backgroundColor = AppColors.primary; //Color(0xFFBD34C59);
        headingColor = Colors.white;

        headingTop = 90;

        loginWidth = windowWidth;
        loginOpacity = 1;

        loginYOffset = keyboardVisible ? 40 : 270;
        loginHeight = keyboardVisible ? windowHeight : windowHeight - 270;

        loginXOffset = 0;
        registerYOffset = windowHeight;
        forgotZOffset = windowHeight;
        update();
        break;
      case 2:
        backgroundColor = AppColors.secondary;
        headingColor = Colors.white;

        headingTop = 80;

        loginWidth = windowWidth - 40;
        loginOpacity = 0.7;

        loginYOffset = keyboardVisible ? 30 : 240;
        loginHeight = keyboardVisible ? windowHeight : windowHeight - 240;

        // forgotZOffset = keyboardVisible ? 20 : 240;
        // forgotHeight = keyboardVisible ? windowHeight : windowHeight - 240;

        loginXOffset = 20;
        registerYOffset = keyboardVisible ? 55 : 270;
        registerHeight = keyboardVisible ? windowHeight : windowHeight - 270;
        update();
        break;

      case 3:
        backgroundColor = AppColors.secondary;
        headingColor = Colors.white;

        headingTop = 80;

        loginWidth = windowWidth - 40;
        loginOpacity = 0.7;

        loginYOffset = keyboardVisible ? 30 : 240;
        loginHeight = keyboardVisible ? windowHeight : windowHeight - 240;

        loginXOffset = 20;

        forgotZOffset = keyboardVisible ? 55 : 270;
        forgotHeight = keyboardVisible ? windowHeight : windowHeight - 270;
        update();
        break;
    }
  }

  void login() async {
    messageError = "";
    update();
    await saveUserStorage(controllerEmail.text, controllerPassword.text);
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(controllerEmail.text.trim());
    if (!emailValid) {
      messageError = "email inválido \n";
      update();
    }
    if (controllerPassword.text.length < 6) {
      messageError += "senha inválida";
      update();
    }
    if (messageError == "") {
      handleSubmit(controllerEmail.text, controllerPassword.text);
    }
  }

  Future<void> handleSubmit(email, password) async {
    isLoading = true;
    update();

    Communication communication = await AuthenticationRepository.auth(email: email, password: password);

    if (communication.status) {
      if (communication.object!.content.status) {
        processLogin((communication.object!.content.data as List).first);
      } else {
        messageError = communication.object!.content.data;
        Timer(Duration(seconds: 5), () {
          messageError = "";
          update();
        });
      }
    } else {
      messageError = communication.message;
    }

    isLoading = false;
    update();
  }

  void processLogin(Map<String, dynamic> content) {
    setUser(content);
    setIsLogged(true);
    setJsonDataUser(jsonEncode(content));
    Get.offNamed(Routes.SYNC);
  }

  Future<void> setIsLogged(bool _isLogged) async {
    // await SecureS.write("isLogged", _isLogged);
  }

  Future<void> setJsonDataUser(json) async {
    // await db.write("jsonUser", json);
  }

  Future<bool> saveUserStorage(String user, String pass) async {
    await SecureStorageRepository.saveEmailUser(user);
    await SecureStorageRepository.savePasswordUser(pass);
    return true;
  }

  getUserStorage() async {
    try {
      controllerEmail.text = await SecureStorageRepository.readEmailUser();
      controllerPassword.text = await SecureStorageRepository.readPasswordUser();
    } catch (err) {
      print("$err");
      print('User not found');
    }
  }

  void setUser(Map<String, dynamic> mapUser) {
    AppController.to.setUser(mapUser);
    print(AppController.to.user.nome);
  }

  Future<void> initIfIsLogged() async {
    // try {
    //   bool isLogged = await db.read('isLogged');
    //   if (isLogged) {
    //     print("Is logged: $isLogged");
    //     // print(await db.read('jsonUser'));
    //     setUser(await db.read('jsonUser'));
    //
    //     //Se tiver conexão com a internet
    //     if (await haveInternet()) {
    //       // Get.off(() => SyncView());
    //     } else {
    //       // Get.off(() => HomeView());
    //     }
    //   }
    // } catch (err) {
    //   print(err);
    // }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _idKeyboardListener = _keyboardUtils.add(
        listener: keyboard_listener.KeyboardListener(willHideKeyboard: () {
      keyboardVisible = false;
      update();
    }, willShowKeyboard: (double keyboardHeight) {
      keyboardVisible = true;
      update();
    }));

    getUserStorage();
    initIfIsLogged();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _keyboardUtils.unsubscribeListener(subscribingId: _idKeyboardListener);
    if (_keyboardUtils.canCallDispose()) {
      _keyboardUtils.dispose();
    }
  }
}
