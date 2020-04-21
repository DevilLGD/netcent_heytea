import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

export 'package:fluwx/fluwx.dart';

class WechatUtils {
  static Future<bool> isWeChatInstalled() {
    return fluwx.isWeChatInstalled;
  }

  static Future<bool> registerWxApi({
    String appId,
    bool doOnIOS: true,
    bool doOnAndroid: true,
    String universalLink,
  }) {
    return fluwx.registerWxApi(
      appId: appId,
      doOnIOS: true,
      doOnAndroid: true,
      universalLink: universalLink,
    );
  }

  /// 实际上，像shareToWeChat or payWithWeChat这种的函数，底层上是调用了原生SDK的sendRequest方法，
  /// 所以他们的返回结果意义不大，他们的返回结果仅仅是sendRequest的返回值。
  /// 为了获取真实的回调，你应该这样做：
  /// [listenToWeChatResponseEvent];
  static Future<bool> wxpay({
    @required String appId,
    @required String partnerId,
    @required String prepayId,
    @required String packageValue,
    @required String nonceStr,
    @required int timeStamp,
    @required String sign,
    String signType,
    String extData,
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

  static StreamSubscription<T>
      listenToResponseEvent<T extends fluwx.BaseWeChatResponse>(
    void onData(T event), {
    Function onError,
    void onDone(),
    bool cancelOnError,
  }) {
    return fluwx.weChatResponseEventHandler.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }
}
