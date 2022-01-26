import 'package:calagem_brasil_pro/app/data/model/plan/PlansModel.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class PlansController extends GetxController {
  CarouselController carouselController = CarouselController();
  int currentPageCarousel = 0;

  // PageController pageController = PageController();
  List<PlansModel> allPlans = [
    PlansModel(
      name: "Free",
      valueMonth: 0.00,
      valueYear: 0.00,
      benefits: ["3 análises", "3 relatórios"],
    ),
    PlansModel(
        name: "Basic",
        valueMonth: 50.00,
        valueYear: 500.00,
        benefits: ["Análises ilimitadas", "Relatórios ilimitados", "3 consultas a expecialista", "Sua logo na recomendação"]),
    PlansModel(
        name: "Premium",
        valueMonth: 150,
        valueYear: 1500.00,
        benefits: ["Análises ilimitadas", "Relatórios ilimitados", "20 consultas a expecialista", "Sua logo na recomendação"]),
  ];
}
