import 'package:json_annotation/json_annotation.dart';

/// This allows the `VideoEntity` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'video_entity.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class VideoEntity {
  final String cover;
  @JsonKey(disallowNullValue: true, required: true)
  final int id;
  @JsonKey(disallowNullValue: true, required: true)
  final String videoDownloadUrl;

  const VideoEntity({
    this.cover = "",
    this.id = 0,
    this.videoDownloadUrl = "",
  });

  /// A necessary factory constructor for creating a new VideoEntity instance
  /// from a map. Pass the map to the generated `_$VideoEntityFromJson()` constructor.
  /// The constructor is named after the source class, in this case, VideoEntity.
  factory VideoEntity.fromJson(Map<String, dynamic> json) =>
      _$VideoEntityFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$VideoEntityToJson`.
  Map<String, dynamic> toJson() => _$VideoEntityToJson(this);
}
