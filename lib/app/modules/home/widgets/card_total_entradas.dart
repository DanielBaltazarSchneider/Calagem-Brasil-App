import 'package:calagem_brasil_pro/app/data/extensions/app_double.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:calagem_brasil_pro/app/theme/app_font_size.dart';
import 'package:flutter/material.dart';

class CardTotalEntradas extends StatelessWidget {
  const CardTotalEntradas({Key? key, required this.listEntradas, required this.onTapEntrada}) : super(key: key);

  final List listEntradas;
  final Function onTapEntrada;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.width * 0.95,
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpansionTile(
              iconColor: AppColors.colorNeutralMedium,
              collapsedIconColor: AppColors.colorNeutralMedium,
              title: Row(
                children: [
                  Icon(
                    Icons.arrow_downward,
                    color: AppColors.colorRedLight,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Total Entradas",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.colorNeutralDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${1119610.toDouble().format_2()} kg",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.colorNeutralDark,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          "${19843.toDouble().format_2()} sc60",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.colorNeutralMediumLight,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              children: [
                Container(
                  height: 1,
                  color: AppColors.colorNeutralLighter,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Produto",
                              style: TextStyle(
                                color: AppColors.colorNeutralDark,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Operação",
                              style: TextStyle(
                                color: AppColors.colorNeutralDark,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Quantidade",
                              style: TextStyle(
                                color: AppColors.colorNeutralDark,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                for (int i = 0; i < listEntradas.length; i++) ...[
                  InkWell(
                    onTap: () => onTapEntrada(listEntradas[i]),
                    child: Container(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      color: i % 2 == 0 ? AppColors.colorNeutralLight : AppColors.colorWhite,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Soja", // "${listMovimentacoes[i].dataRomaneio.format_dd_MM_yyyy()}",
                                  style: TextStyle(
                                    color: AppColors.colorNeutralDark,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      "Entrada p/ depósito ddd ddd",
                                      style: TextStyle(
                                        color: AppColors.colorNeutralDark,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${1119610.toDouble().format_2()} kg",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.colorNeutralDark,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Text(
                                      "${19843.toDouble().format_2()} sc60",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.colorNeutralMediumLight,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.chevron_right_outlined),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
