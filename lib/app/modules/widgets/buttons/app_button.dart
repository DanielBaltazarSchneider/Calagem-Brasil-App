import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function? onPressed;

  const AppButton({Key? key, required this.title, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        '$title',
        style: TextStyle(
          color: context.theme.hintColor,
        ),
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        padding: MaterialStateProperty.all(EdgeInsets.all(5)),
        textStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
