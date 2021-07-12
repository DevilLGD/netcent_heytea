// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoEntity _$VideoEntityFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['id', 'videoDownloadUrl'],
      disallowNullValues: const ['id', 'videoDownloadUrl']);
  return VideoEntity(
    cover: json['cover'] as String,
    id: json['id'] as int,
    videoDownloadUrl: json['videoDownloadUrl'] as String,
  );
}

Map<String, dynamic> _$VideoEntityToJson(VideoEntity instance) {
  final val = <String, dynamic>{
    'cover': instance.cover,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('videoDownloadUrl', instance.videoDownloadUrl);
  return val;
}
