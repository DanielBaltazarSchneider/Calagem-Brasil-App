import 'package:flutter/material.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';

class CardAtalho extends StatelessWidget {
  const CardAtalho({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);
  final String title;
  final IconData icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1 / 1.05,
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            margin: EdgeInsets.all(2),
            child: Card(
              color: AppColors.colorNeutralLight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.colorNeutralDark,
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Icon(icon, color: AppColors.colorWhite),
                  ),
                  Text(
                    "$title",
                    style: TextStyle(fontSize: 12, color: AppColors.colorNeutralDark, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
