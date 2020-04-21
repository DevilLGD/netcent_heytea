import 'package:decimal/decimal.dart';

class NumberUtils {

  static String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  static String sixDigits(int n) {
    if (n >= 100000) return "$n";
    if (n >= 10000) return "0$n";
    if (n >= 1000) return "00$n";
    if (n >= 100) return "000$n";
    if (n >= 10) return "0000$n";
    return "00000$n";
  }
}

extension DecimalExt on Decimal {

  String fractionalPart(int fractionDigits) {
    final fractionalPart = this % Decimal.one;
    if (fractionalPart == Decimal.zero) {
      return "";
    } else {
      return fractionalPart
          .toString()
          .replaceFirst("0.", "");
    }
  }
}