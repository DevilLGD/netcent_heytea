import 'dart:async';

import 'package:tobias/tobias.dart' as tobias;

class AlipayUtils {
  static Future<bool> isAliPayInstalled = tobias.isAliPayInstalled();

  static Future<String> alipayVersion = tobias.aliPayVersion();

  static Future<Map> alipay(String order, {bool inSandBox = false}) {
    final evn = inSandBox ? tobias.AliPayEvn.SANDBOX : tobias.AliPayEvn.ONLINE;
    return tobias.aliPay(order, evn: evn);
  }

  static String resultStatus(Map result) {
    if (result == null) {
      return null;
    }
    return result["resultStatus"];
  }
}
