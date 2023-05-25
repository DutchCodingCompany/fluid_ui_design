import 'dart:math';

import '../core/fluid_size.dart';
import '../core/theme/fluid_config_theme_extension.dart';

class FluidType {
  final int scaleStep;

  final FluidConfig fluidConfig;

  const FluidType({required this.fluidConfig, required this.scaleStep});

  double get min =>
      _getModifiedValue(fluidConfig.typeConfig.minBaseFontSize, fluidConfig.typeConfig.minTypeScaleModifier);
  double get max =>
      _getModifiedValue(fluidConfig.typeConfig.maxBaseFontSize, fluidConfig.typeConfig.maxTypeScaleModifier);

  double _getModifiedValue(double baseValue, double scaleModifier) {
    double modifier = pow(scaleModifier, scaleStep).toDouble();
    if (modifier > 0) {
      return baseValue * modifier;
    } else {
      return baseValue / modifier.abs();
    }
  }

  double get value {
    return FluidSize(fluidConfig: fluidConfig, min: min, max: max).value;
  }
}

typedef FluidFontSize = FluidType;
