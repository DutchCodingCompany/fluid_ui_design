class TypeConfig {
  const TypeConfig({
    this.minBaseFontSize = 17,
    this.maxBaseFontSize = 20,
    this.minTypeScaleModifier = 1.2,
    this.maxTypeScaleModifier = 1.333,
  });

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
