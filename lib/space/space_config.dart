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

  /// Base Minimal Value for [FluidSpace]
  final double baseMin;

  /// Base Maximal Value for [FluidSpace]
  final double baseMax;

  /// xxxs modifier for [FluidSpace], default is 0.25, which means 25% of [baseMin] and [baseMax]
  /// this modifier is usable with [FluidSpaces.xxxs]
  final double xxxsModifier;

  /// xxs modifier for [FluidSpace], default is 0.5, which means 50% of [baseMin] and [baseMax]
  /// this modifier is usable with [FluidSpaces.xxs]
  final double xxsModifier;

  /// xs modifier for [FluidSpace], default is 0.75, which means 75% of [baseMin] and [baseMax]
  /// this modifier is usable with [FluidSpaces.xs]
  final double xsModifier;

  /// s modifier for [FluidSpace], default is 1, which means 100% of [baseMin] and [baseMax]
  /// this modifier is usable with [FluidSpaces.s]
  final double sModifier;

  /// m modifier for [FluidSpace], default is 1.5, which means 150% of [baseMin] and [baseMax]
  /// this modifier is usable with [FluidSpaces.m]
  final double mModifier;

  /// l modifier for [FluidSpace], default is 2, which means 200% of [baseMin] and [baseMax]
  /// this modifier is usable with [FluidSpaces.l]
  final double lModifier;

  /// xl modifier for [FluidSpace], default is 3, which means 300% of [baseMin] and [baseMax]
  /// this modifier is usable with [FluidSpaces.xl]
  final double xlModifier;

  /// xxl modifier for [FluidSpace], default is 4, which means 400% of [baseMin] and [baseMax]
  /// this modifier is usable with [FluidSpaces.xxl]
  final double xxlModifier;

  /// xxxl modifier for [FluidSpace], default is 6, which means 600% of [baseMin] and [baseMax]
  /// this modifier is usable with [FluidSpaces.xxxl]
  final double xxxlModifier;
}
