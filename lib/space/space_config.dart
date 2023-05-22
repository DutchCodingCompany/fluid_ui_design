import 'dart:core';

class SpaceConfig {
  const SpaceConfig({
    this.baseMin = 17,
    this.baseMax = 20,
    this.xxxsModifier = 0.25,
    this.xxsModifier = 0.5,
    this.xsModifier = 0.75,
    this.sModifier = 1,
    this.mModifier = 1.5,
    this.lModifier = 2,
    this.xlModifier = 3,
    this.xxlModifier = 4,
    this.xxxlModifier = 6,
  });

  final double baseMin;
  final double baseMax;

  final double xxxsModifier;
  final double xxsModifier;
  final double xsModifier;
  final double sModifier;
  final double mModifier;
  final double lModifier;
  final double xlModifier;
  final double xxlModifier;
  final double xxxlModifier;
}
