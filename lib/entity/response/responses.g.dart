// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['code'], disallowNullValues: const ['code']);
  return BaseResponse(
    code: json['code'] as int,
    desc: (json['desc'] as List<dynamic>).map((e) => e as String).toList(),
    data: json['data'],
  );
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'desc': instance.desc,
      'data': instance.data,
    };
