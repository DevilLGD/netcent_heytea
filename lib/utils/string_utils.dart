class StringUtils {
  static String mask(String text) {
    if (text == null) {
      return "";
    }

    switch (text.length) {
      case 0:
        return "";
      case 1:
        return "*";
      case 2:
        return "${text.substring(0, 1)}*";
      default:
        final first = text.substring(0, 1);
        final last = text.substring(text.length - 1, text.length);

        return "$first***$last";
    }
  }
}
