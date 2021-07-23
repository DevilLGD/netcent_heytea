import 'package:json_annotation/json_annotation.dart';

/// This allows the `BaseResponse` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'responses.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class BaseResponse {
  @JsonKey(disallowNullValue: true, required: true)
  final int code;
  final List<String> desc;
  final data;

  const BaseResponse({this.code = 0, this.desc = const[], this.data});

  bool isSuccess() => code == 200;

  /// A necessary factory constructor for creating a new BaseResponse instance
  /// from a map. Pass the map to the generated `_$BaseResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, BaseResponse.
  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    if (json["error_code"] as String != null) {
      json = {"code": json["error_code"] == "0" ? 200 : 500,
        "desc": [json["error_msg"]],
        "data": json["data"]
      };
    }
    return _$BaseResponseFromJson(json);
  }


  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$BaseResponseToJson`.
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}