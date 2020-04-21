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
    desc: (json['desc'] as List)?.map((e) => e as String)?.toList(),
    data: json['data'],
  );
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  val['desc'] = instance.desc;
  val['data'] = instance.data;
  return val;
}
