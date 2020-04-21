import 'package:json_annotation/json_annotation.dart';

/// This allows the `WxPayRequest` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'wx_pay_request.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class WxPayRequest {
  final String appId;
  final String nonceStr;
  final String packageValue;
  final String partnerId;
  final String prepayId;
  final String sign;
  final String timeStamp;

  const WxPayRequest(
    this.appId,
    this.nonceStr,
    this.packageValue,
    this.partnerId,
    this.prepayId,
    this.sign,
    this.timeStamp,
  );

  /// A necessary factory constructor for creating a new WxPayRequest instance
  /// from a map. Pass the map to the generated `_$WxPayRequestFromJson()` constructor.
  /// The constructor is named after the source class, in this case, WxPayRequest.
  factory WxPayRequest.fromJson(Map<String, dynamic> json) =>
      _$WxPayRequestFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$WxPayRequestToJson`.
  Map<String, dynamic> toJson() => _$WxPayRequestToJson(this);
}
