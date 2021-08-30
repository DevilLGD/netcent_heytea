

class BaseWeChatResponse {
  final int errCode;
  final String? errStr;

  bool get isSuccessful => errCode == 0;

  BaseWeChatResponse._(this.errCode, this.errStr);

  /// create response from response pool
  factory BaseWeChatResponse.create(String name, Map argument) {
    return BaseWeChatResponse.create(name, argument);
  }
}


///true if WeChat installed,otherwise false.
///Please add WeChat to the white list in order to get the correct result on IOS.
Future<bool> get isWeChatInstalled async {
  return false;
}


/// request payment with WeChat.
/// Read the official document for more detail.
/// [timeStamp] is int because [timeStamp] will be mapped to Unit32.
Future<bool> payWithWeChat(
    {required String appId,
      required String partnerId,
      required String prepayId,
      required String packageValue,
      required String nonceStr,
      required int timeStamp,
      required String sign,
      String? signType,
      String? extData}) async {
  return false;
}


Future<bool> registerWxApi(
    {required String appId,
      bool doOnIOS: true,
      bool doOnAndroid: true,
      String? universalLink}) async {
  return false;
}

class WeChatPaymentResponse {

}