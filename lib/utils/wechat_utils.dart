import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:heytea_kit/utils/test_fluwx.dart' as fluwx;
//import 'package:fluwx/fluwx.dart' as fluwx;

//export 'package:fluwx/fluwx.dart';

class WechatUtils {
  static Future<bool> isWeChatInstalled() {
    return fluwx.isWeChatInstalled;
  }

  /// 实际上，像shareToWeChat or payWithWeChat这种的函数，底层上是调用了原生SDK的sendRequest方法，
  /// 所以他们的返回结果意义不大，他们的返回结果仅仅是sendRequest的返回值。
  /// 为了获取真实的回调，你应该这样做：
  /// [listenToWeChatResponseEvent];
  static Future<bool> wxpay({
    required String appId,
    required String partnerId,
    required String prepayId,
    required String packageValue,
    required String nonceStr,
    required int timeStamp,
    required String sign,
    String signType = "",
    String extData = "",
  }) {
    return fluwx.payWithWeChat(
      appId: appId,
      partnerId: partnerId,
      prepayId: prepayId,
      packageValue: packageValue,
      nonceStr: nonceStr,
      timeStamp: timeStamp,
      sign: sign,
    );
  }
}
