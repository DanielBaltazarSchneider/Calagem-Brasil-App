import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';

class InputWithIcon extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final bool enabled;
  final TextInputType keyboardType;

  InputWithIcon({
    required this.icon,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFBC7C7C7), width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: <Widget>[
          Container(
              width: 60,
              child: Icon(
                icon,
                size: 20,
                color: Color(0xFFBB9B9B9),
              )),
          Expanded(
            child: TextField(
              enabled: enabled,
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              cursorColor: AppColors.primary,
              decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 10), border: InputBorder.none, hintText: hint),
            ),
          )
        ],
      ),
    );
  }
}
