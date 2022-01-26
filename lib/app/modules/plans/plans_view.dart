import 'package:calagem_brasil_pro/app/data/functions/MyNumberFormat.dart';
import 'package:calagem_brasil_pro/app/modules/home/home_view.dart';
import 'package:calagem_brasil_pro/app/modules/plans/plans_controller.dart';
import 'package:calagem_brasil_pro/app/modules/widgets/buttons/PrimaryButton.dart';
import 'package:calagem_brasil_pro/app/theme/app_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlansView extends StatelessWidget {
  const PlansView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlansController>(
        init: PlansController(),
        builder: (_) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              backgroundColor: AppColors.secondary,
              appBar: AppBar(
                title: Text('Escolha um plano'),
                elevation: 0,
                backgroundColor: AppColors.secondary,
                actions: [
                  // IconButton(
                  //   onPressed: () => null,
                  //   icon: Icon(Icons.arrow_right),
                  // ),
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CarouselSlider(
                    carouselController: _.carouselController,
                    options: CarouselOptions(
                        height: Get.height * 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        onPageChanged: (page, c) {
                          print(page);
                          _.currentPageCarousel = page;
                          _.update();
                        }),
                    items: _.allPlans.map((plan) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.all(Get.width * 0.05),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      plan.name.toUpperCase(),
                                      style: TextStyle(fontSize: Get.width * 0.1, fontWeight: FontWeight.w900),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: Get.width * 0.15, right: Get.width * 0.15),
                                      child: Divider(
                                        thickness: 3,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: Get.width * 0.13,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                r"R$ ",
                                                style: TextStyle(fontSize: Get.width * 0.08),
                                              ),
                                              Text(
                                                MyNumberFormat.format_2(plan.valueMonth),
                                                style: TextStyle(fontSize: Get.width * 0.12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (plan.valueMonth != 0.0)
                                          Column(
                                            children: [
                                              Text(
                                                "mensal",
                                                style: TextStyle(
                                                  fontSize: Get.width * 0.07,
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                    if (1 == 0.0)
                                      Column(
                                        children: [
                                          Container(
                                            height: Get.width * 0.13,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  r"R$ ",
                                                  style: TextStyle(fontSize: Get.width * 0.08),
                                                ),
                                                Text(
                                                  MyNumberFormat.format_2(plan.valueYear),
                                                  style: TextStyle(fontSize: Get.width * 0.11),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (plan.valueMonth != 0.0)
                                            Column(
                                              children: [
                                                Text(
                                                  "anual",
                                                  style: TextStyle(
                                                    fontSize: Get.width * 0.07,
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                  ],
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      for (int i = 0; i < plan.benefits.length; i++)
                                        Padding(
                                          padding: EdgeInsets.only(top: Get.width * 0.02, bottom: Get.width * 0.02),
                                          child: Row(
                                            children: [
                                              Icon(Icons.check_circle_outline),
                                              Text("  " + plan.benefits[i]),
                                            ],
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(Get.width * 0.05),
                                  child: PrimaryButton(btnText: "ASSINAR", onTap: () => Get.off(HomeView())),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _.currentPageCarousel == 0 ? Icons.circle : Icons.circle_outlined,
                        color: Colors.white,
                        size: Get.width * 0.05,
                      ),
                      SizedBox(width: Get.width * 0.02),
                      Icon(
                        _.currentPageCarousel == 1 ? Icons.circle : Icons.circle_outlined,
                        color: Colors.white,
                        size: Get.width * 0.05,
                      ),
                      SizedBox(width: Get.width * 0.02),
                      Icon(
                        _.currentPageCarousel == 2 ? Icons.circle : Icons.circle_outlined,
                        color: Colors.white,
                        size: Get.width * 0.05,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
