class TypeConfig {
  const TypeConfig({
    this.minBaseFontSize = 17,
    this.maxBaseFontSize = 20,
    this.minTypeScaleModifier = 1.2,
    this.maxTypeScaleModifier = 1.333,
  });

  final double minBaseFontSize;
  final double maxBaseFontSize;

  final double minTypeScaleModifier;
  final double maxTypeScaleModifier;
}
