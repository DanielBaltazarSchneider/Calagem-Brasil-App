import 'package:intl/intl.dart';

extension AppDouble on double {
  String format_2() {
    return NumberFormat("#,##0.##", "pt_BR").format(this);
  }

  String format_200() {
    return NumberFormat("#,##0.00", "pt_BR").format(this);
  }

  String format_20() {
    return NumberFormat("#,##0.0", "pt_BR").format(this);
  }

  String format_1() {
    return NumberFormat("#,##0.#", "pt_BR").format(this);
  }

  String format_0() {
    return NumberFormat("#,##", "pt_BR").format(this);
  }
}
