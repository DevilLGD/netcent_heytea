import 'package:json_annotation/json_annotation.dart';

/// This allows the `OpeningAdEntity` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'opening_ad_entity.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class OpeningAdEntity {
  final int adGroupId;
  final String adGroupName;
  final String openImage;
  final int type;

  const OpeningAdEntity(this.adGroupId, this.adGroupName, this.openImage, this.type);

  /// A necessary factory constructor for creating a new OpeningAdEntity instance
  /// from a map. Pass the map to the generated `_$OpeningAdEntityFromJson()` constructor.
  /// The constructor is named after the source class, in this case, OpeningAdEntity.
  factory OpeningAdEntity.fromJson(Map<String, dynamic> json) =>
      _$OpeningAdEntityFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$OpeningAdEntityToJson`.
  Map<String, dynamic> toJson() => _$OpeningAdEntityToJson(this);
}