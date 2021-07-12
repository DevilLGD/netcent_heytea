// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_ad_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpeningAdEntity _$OpeningAdEntityFromJson(Map<String, dynamic> json) {
  return OpeningAdEntity(
    json['adGroupId'] as int,
    json['adGroupName'] as String,
    json['openImage'] as String,
    json['type'] as int,
  );
}

Map<String, dynamic> _$OpeningAdEntityToJson(OpeningAdEntity instance) =>
    <String, dynamic>{
      'adGroupId': instance.adGroupId,
      'adGroupName': instance.adGroupName,
      'openImage': instance.openImage,
      'type': instance.type,
    };
