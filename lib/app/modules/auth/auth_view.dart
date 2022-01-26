import 'package:calagem_brasil_pro/app/modules/auth/register_controller.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/buttons/OutlineButton.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/buttons/PrimaryButton.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/inputs/InputWithIcon.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'forgot_controller.dart';
import 'login_controller.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          _.changeState();
          return WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                child: Stack(
                  children: <Widget>[
                    AnimatedContainer(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: Duration(milliseconds: 1500),
                      color: _.backgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _.pageState = 0;
                              _.update();
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  AnimatedContainer(
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    duration: Duration(milliseconds: 1500),
                                    margin: EdgeInsets.only(
                                      top: _.headingTop,
                                    ),
                                    child: Text(
                                      "Calagem Brasil PRO",
                                      style: TextStyle(color: _.headingColor, fontSize: 26),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "Assistência técnica\nCálculos de calagem e distribuição\nMaior precisão e qualidade na sua lavoura",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: _.headingColor, fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Center(
                              child: Image.asset(
                                "assets/images/logo_calagem.png",
                                width: 300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(32),
                            child: PrimaryButton(
                              btnText: "Iniciar",
                              onTap: () {
                                if (_.pageState != 0) {
                                  _.pageState = 0;
                                  _.update();
                                } else {
                                  _.pageState = 1;
                                  _.update();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                      width: _.loginWidth,
                      height: _.loginHeight,
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: Duration(milliseconds: 1500),
                      transform: Matrix4.translationValues(_.loginXOffset, _.loginYOffset, 1),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(_.loginOpacity),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  "Faça o login para entrar",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              InputWithIcon(
                                controller: _.controllerEmail,
                                keyboardType: TextInputType.emailAddress,
                                icon: Icons.email,
                                hint: "Seu Email...",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InputWithIcon(
                                controller: _.controllerPassword,
                                obscureText: true,
                                icon: Icons.vpn_key,
                                hint: "Sua Senha...",
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _.messageError,
                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              if (_.isLoading) ...[
                                CircularProgressIndicator(),
                              ] else ...[
                                PrimaryButton(
                                  onTap: () {
                                    _.login();
                                  },
                                  btnText: "Entrar",
                                ),
                              ],
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _.pageState = 2;
                                  _.update();
                                },
                                child: OutlineBtn(
                                  btnText: "Não tenho uma conta",
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _.pageState = 3;
                                  _.update();
                                },
                                child: Text(
                                  "Esqueci minha senha",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GetBuilder<RegisterController>(
                      init: RegisterController(),
                      builder: (register) {
                        return AnimatedContainer(
                          height: _.registerHeight,
                          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 1500),
                          transform: Matrix4.translationValues(0, _.registerYOffset, 1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "Criar uma conta",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  InputWithIcon(
                                    controller: register.controllerName,
                                    icon: Icons.drive_file_rename_outline,
                                    hint: "Seu Nome...",
                                    enabled: false,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InputWithIcon(
                                    controller: register.controllerEmail,
                                    icon: Icons.email,
                                    hint: "Seu Email...",
                                    enabled: false,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InputWithIcon(
                                    controller: register.controllerPassword,
                                    icon: Icons.vpn_key,
                                    hint: "Sua Senha...",
                                    enabled: false,
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  PrimaryButton(
                                    onTap: () {
                                      register.validateForm();
                                      _.pageState = 1;
                                      _.update();
                                    },
                                    btnText: "Registrar",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _.pageState = 1;
                                      _.update();
                                    },
                                    child: OutlineBtn(
                                      btnText: "Voltar para o login",
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    GetBuilder<ForgotController>(
                      init: ForgotController(email: _.controllerEmail.text),
                      builder: (forgot) {
                        return AnimatedContainer(
                          height: _.forgotHeight,
                          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 1500),
                          transform: Matrix4.translationValues(0, _.forgotZOffset, 1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "Recuperar senha",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  InputWithIcon(
                                    controller: forgot.controllerEmail,
                                    icon: Icons.email,
                                    hint: "Seu Email...",
                                    enabled: false,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  PrimaryButton(
                                    onTap: () {
                                      _.pageState = 1;
                                      _.update();
                                      forgot.sendForgotPassword();
                                    },
                                    btnText: "Recuperar senha",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _.pageState = 1;
                                      _.update();
                                    },
                                    child: OutlineBtn(
                                      btnText: "Voltar para o login",
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
