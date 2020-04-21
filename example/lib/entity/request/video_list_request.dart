import 'package:json_annotation/json_annotation.dart';

/// This allows the `VideoListRequest` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'video_list_request.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class VideoListRequest {
  final int pageSize;

  const VideoListRequest(this.pageSize);

  /// A necessary factory constructor for creating a new VideoListRequest instance
  /// from a map. Pass the map to the generated `_$VideoListRequestFromJson()` constructor.
  /// The constructor is named after the source class, in this case, VideoListRequest.
  factory VideoListRequest.fromJson(Map<String, dynamic> json) =>
      _$VideoListRequestFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$VideoListRequestToJson`.
  Map<String, dynamic> toJson() => _$VideoListRequestToJson(this);
}