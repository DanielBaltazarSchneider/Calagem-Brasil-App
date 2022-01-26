import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({this.leftClild, this.centerClild, this.rightClild});
  final Widget? leftClild;
  final Widget? centerClild;
  final Widget? rightClild;

  @override
  AppBar bar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leftClild ?? Container(),
          centerClild ?? Image.asset("assets/images/png/logo_completa.png"),
          rightClild ?? Container(),
        ],
      ),
    );
  }
}
