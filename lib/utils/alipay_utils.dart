import 'dart:async';

import 'package:fake_alipay/fake_alipay.dart';
import 'package:flutter/foundation.dart';

class AlipayUtils {
  static Future<bool> isAliPayInstalled(Alipay alipay) {
    return alipay.isAlipayInstalled();
  }

  static Future<void> alipaySign(
    Alipay alipay, {
    @required String orderInfo,
    bool isShowLoading = true,
  }) {
    return alipay.payOrderSign(
      orderInfo: orderInfo,
      isShowLoading: isShowLoading,
    );
  }
}
