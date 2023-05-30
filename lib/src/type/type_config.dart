class TypeConfig {
  const TypeConfig({
    this.minBaseFontSize = 17,
    this.maxBaseFontSize = 20,
    this.minTypeScaleModifier = 1.2,
    this.maxTypeScaleModifier = 1.333,
  });

  //Copy With
  TypeConfig copyWith({
    double? minBaseFontSize,
    double? maxBaseFontSize,
    double? minTypeScaleModifier,
    double? maxTypeScaleModifier,
  }) {
    return TypeConfig(
      minBaseFontSize: minBaseFontSize ?? this.minBaseFontSize,
      maxBaseFontSize: maxBaseFontSize ?? this.maxBaseFontSize,
      minTypeScaleModifier: minTypeScaleModifier ?? this.minTypeScaleModifier,
      maxTypeScaleModifier: maxTypeScaleModifier ?? this.maxTypeScaleModifier,
    );
  }

  /// Base Minimal Value for [FluidType]
  /// default is 17
  final double minBaseFontSize;

  /// Base Maximal Value for [FluidType]
  /// default is 20
  final double maxBaseFontSize;

  /// Minimal Type Scale Modifier for [FluidType]
  /// default is 1.2
  final double minTypeScaleModifier;

  /// Maximal Type Scale Modifier for [FluidType]
  /// default is 1.333
  final double maxTypeScaleModifier;
}
