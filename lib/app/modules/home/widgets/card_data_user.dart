import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:flutter/material.dart';

class CardDataUse extends StatelessWidget {
  const CardDataUse({Key? key, required this.nome, required this.temp}) : super(key: key);

  final String nome;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 10, right: 20, bottom: 10),
      child: Row(
        children: [
          CircleAvatar(
            maxRadius: 20,
            backgroundColor: AppColors.colorBrandPrimaryMedium,
            child: Text(
              "${nome.substring(0, 2).toUpperCase()}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.colorWhite,
              ),
            ),
          ),
          SizedBox(width: 13),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Text(
                  "Oi, ",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  "$nome",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                )
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.wb_sunny_rounded,
                    color: AppColors.colorOrange,
                  ),
                  Text(
                    "$temp° C",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
