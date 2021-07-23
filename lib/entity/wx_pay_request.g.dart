// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wx_pay_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WxPayRequest _$WxPayRequestFromJson(Map<String, dynamic> json) {
  return WxPayRequest(
    json['appId'] as String,
    json['nonceStr'] as String,
    json['packageValue'] as String,
    json['partnerId'] as String,
    json['prepayId'] as String,
    json['sign'] as String,
    json['timeStamp'] as String,
  );
}

Map<String, dynamic> _$WxPayRequestToJson(WxPayRequest instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'nonceStr': instance.nonceStr,
      'packageValue': instance.packageValue,
      'partnerId': instance.partnerId,
      'prepayId': instance.prepayId,
      'sign': instance.sign,
      'timeStamp': instance.timeStamp,
    };
