// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return PaymentMethod(
    json['id'] as int,
    json['code'] as String,
    json['icon'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'icon': instance.icon,
      'name': instance.name,
    };
