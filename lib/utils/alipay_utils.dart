import 'dart:async';

//import 'package:fake_alipay/fake_alipay.dart';
import 'package:flutter/foundation.dart';

class Alipay {
  Alipay();
}

class AlipayResp {
  AlipayResp();

  int resultStatus;

  String memo;
}

class AlipayUtils {
  static Future<bool> isAliPayInstalled(Alipay alipay) async {
    return await false;
  }

  static Future<void> alipaySign(
      Alipay alipay, {
        @required String orderInfo,
        bool isShowLoading = true,
      }) async {
    return;
  }
}
