import 'package:json_annotation/json_annotation.dart';

/// This allows the `PaymentMethod` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'payment_method.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class PaymentMethod {
  final int id;
  final String code;
  final String icon;
  final String name;

  const PaymentMethod(
    this.id,
    this.code,
    this.icon,
    this.name,
  );

  /// A necessary factory constructor for creating a new PaymentMethod instance
  /// from a map. Pass the map to the generated `_$PaymentMethodFromJson()` constructor.
  /// The constructor is named after the source class, in this case, PaymentMethod.
  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$PaymentMethodToJson`.
  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
