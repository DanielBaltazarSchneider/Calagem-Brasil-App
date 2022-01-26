import 'package:intl/intl.dart';

class MyDateFormat {
  static String format_yyyy_MM_dd_hh_mm(String date) {
    try {
      return DateFormat('yyyy/MM/dd hh:mm').format(DateTime.parse(date));
    } catch (err) {
      return "";
    }
  }

  static String format_yyyy_MM_dd(String date) {
    try {
      return DateFormat('yyyy/MM/dd').format(DateTime.parse(date));
    } catch (err) {
      return "";
    }
  }

  static String format_dd_MM_yyyy_hh_mm(String date) {
    try {
      return DateFormat('dd/MM/yyyy hh:mm').format(DateTime.parse(date));
    } catch (err) {
      return "";
    }
  }

  static String format_dd_MM_yyyy(String date) {
    try {
      return DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
    } catch (err) {
      return "";
    }
  }

  static String format_hh_mm(String date) {
    try {
      return DateFormat('hh:mm').format(DateTime.parse(date));
    } catch (err) {
      return "";
    }
  }

  static String format_dd_MM(String date) {
    try {
      return DateFormat('dd/MM').format(DateTime.parse(date));
    } catch (err) {
      return "";
    }
  }

  static String format_dd(String date) {
    try {
      return DateFormat('dd').format(DateTime.parse(date));
    } catch (err) {
      return "";
    }
  }

  static String format_MM(String date) {
    try {
      return DateFormat('MM').format(DateTime.parse(date));
    } catch (err) {
      return "";
    }
  }

  static String format_yyyy(String date) {
    try {
      return DateFormat('yyyy').format(DateTime.parse(date));
    } catch (err) {
      return "";
    }
  }

  static String toMonthAbbreviation(int mont) {
    switch (mont) {
      case 1:
        return "JAN";
      case 2:
        return "FEV";
      case 3:
        return "MAR";
      case 4:
        return "ABR";
      case 5:
        return "MAI";
      case 6:
        return "JUN";
      case 7:
        return "JUL";
      case 8:
        return "AGO";
      case 9:
        return "SET";
      case 10:
        return "OUT";
      case 11:
        return "NOV";
      case 12:
        return "DEZ";
      default:
        return "";
    }
  }

  static String toCurrentMonth(int mont) {
    switch (mont) {
      case 1:
        return "janeiro";
      case 2:
        return "fevereiro";
      case 3:
        return "março";
      case 4:
        return "abril";
      case 5:
        return "maio";
      case 6:
        return "junho";
      case 7:
        return "julho";
      case 8:
        return "agosto";
      case 9:
        return "setembro";
      case 10:
        return "outubro";
      case 11:
        return "novembro";
      case 12:
        return "dezembro";
      default:
        return "";
    }
  }
}
