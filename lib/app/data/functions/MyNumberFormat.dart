import 'package:intl/intl.dart';

class MyNumberFormat {
  static String format_2(double number) {
    return NumberFormat("#,##0.##", "pt_BR").format(number);
  }

  static String format_200(double number) {
    return NumberFormat("#,##0.00", "pt_BR").format(number);
  }

  static String format_20(double number) {
    return NumberFormat("#,##0.0", "pt_BR").format(number);
  }

  static String format_1(double number) {
    return NumberFormat("#,##0.#", "pt_BR").format(number);
  }

  static String format_0(double number) {
    return NumberFormat("#,##0", "pt_BR").format(number);
  }
}
