import 'dart:convert';

import 'package:heytea_kit/utils/url_params.dart';

mixin PageParams {
  Map<String, dynamic> get values;

  static T? getValue<T>(Map<String, dynamic> parameters, String key) {
    if (parameters != null) {
      final values = parameters[key];
      if (values is Iterable) {
        if (values.isNotEmpty) {
          return values.first;
        }
      } else {
        return values;
      }
    }
    return null;
  }

  static String? encodeValue(
    Object value, {
    Object? toEncodable(Object? nonEncodable)?,
  }) {
    if (value == null) {
      return null;
    }

    final jsonStr = jsonEncode(
      value,
      toEncodable: toEncodable,
    );
    final jsonBytes = utf8.encode(jsonStr);
    final jsonBase64 = base64UrlEncode(jsonBytes);

    return jsonBase64;
  }

  static dynamic decodeValue(
    String source, {
    Object? reviver(Object? key, Object? value)?,
  }) {
    if (source == null) {
      return null;
    }

    final jsonBytes = base64Decode(source);
    final jsonStr = utf8.decode(jsonBytes);
    final value = jsonDecode(
      jsonStr,
      reviver: reviver,
    );

    return value;
  }

  @override
  String toString() {
    if (values?.isEmpty ?? true) {
      return '';
    }

    final urlParams = URLParams();
    values.forEach((key, value) {
      urlParams.append(key, value);
    });
    final urlParamsString = urlParams.toString();

    if (urlParamsString.isEmpty) {
      return '';
    } else {
      return '?$urlParamsString';
    }
  }
}

class DefaultPageParams with PageParams {
  @override
  Map<String, dynamic> values;

  DefaultPageParams(this.values);
}
