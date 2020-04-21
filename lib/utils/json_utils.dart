import 'dart:convert';

class JsonUtils {
  static List<T> jsonToList<T>(String source) {
    if (source == null || source.isEmpty) {
      return [];
    }

    final result = jsonDecode(source);
    if (result is List) {
      return result.cast<T>();
    }

    throw FormatException();
  }
}
