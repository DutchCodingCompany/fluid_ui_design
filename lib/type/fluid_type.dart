import 'dart:math';

import 'package:fluid_ui_design/fluid_size.dart';

import '../core/fluid_config_state.dart';

class FluidType {
  final int scaleStep;

  const FluidType(this.scaleStep);

  double get min => _getModifiedValue(
      FluidConfigState.instance.typeConfig.minBaseFontSize, FluidConfigState.instance.typeConfig.minTypeScaleModifier);
  double get max => _getModifiedValue(
      FluidConfigState.instance.typeConfig.maxBaseFontSize, FluidConfigState.instance.typeConfig.maxTypeScaleModifier);

  double _getModifiedValue(double baseValue, double scaleModifier) {
    double modifier = pow(scaleModifier, scaleStep).toDouble();
    if (modifier > 0) {
      return baseValue * modifier;
    } else {
      return baseValue / modifier.abs();
    }
  }

  double get space {
    return FluidSize(min: min, max: max).width;
  }
}
