import 'package:flutter/material.dart';

import '../../../fluid_ui_design.dart';

@immutable
class FluidConfig extends ThemeExtension<FluidConfig> {
  final SpaceConfig spaceConfig;
  final TypeConfig typeConfig;
  final ViewportConfig viewportConfig;
  final double screenWidth;

  const FluidConfig(
    this.screenWidth, {
    this.spaceConfig = const SpaceConfig(),
    this.typeConfig = const TypeConfig(),
    this.viewportConfig = const ViewportConfig(),
  });

  static FluidConfig fromContext(
    BuildContext context, {
    SpaceConfig spaceConfig = const SpaceConfig(),
    TypeConfig typeConfig = const TypeConfig(),
    ViewportConfig viewportConfig = const ViewportConfig(),
  }) {
    return FluidConfig(
      MediaQuery.of(context).size.width,
      spaceConfig: spaceConfig,
      typeConfig: typeConfig,
      viewportConfig: viewportConfig,
    );
  }

  @override
  FluidConfig copyWith(
      {double? screenWidth, SpaceConfig? spaceConfig, TypeConfig? typeConfig, ViewportConfig? viewportConfig}) {
    return FluidConfig(
      screenWidth ?? this.screenWidth,
      spaceConfig: spaceConfig ?? this.spaceConfig,
      typeConfig: typeConfig ?? this.typeConfig,
      viewportConfig: viewportConfig ?? this.viewportConfig,
    );
  }

  @override
  ThemeExtension<FluidConfig> lerp(covariant ThemeExtension<FluidConfig>? other, double t) {
    return copyWith(screenWidth: screenWidth + (((other! as FluidConfig).screenWidth - screenWidth) * t));
  }

  static FluidConfig of(BuildContext context, {double? screenWidth}) {
    FluidConfig? config = Theme.of(context).extension<FluidConfig>();

    config ??= FluidConfig(MediaQuery.of(context).size.width);

    if (screenWidth != null) {
      config = config.copyWith(screenWidth: screenWidth);
    }

    return config;
  }

  FluidSpaces get spaces => FluidSpaces(this);
  FluidSpaceHelper get space => FluidSpaceHelper(this);

  double size({required double min, required double max}) => FluidSize(fluidConfig: this, min: min, max: max).value;

  double typeSize(int scale, {FluidConfig? fluidConfig}) => fluidConfig == null
      ? FluidType(fluidConfig: this, scaleStep: scale).value
      : FluidType(scaleStep: scale, fluidConfig: fluidConfig).value;

  double fontSize(int scale, {FluidConfig? fluidConfig}) => typeSize(scale, fluidConfig: fluidConfig);
}

extension FluidConfigThemeExtension on BuildContext {
  FluidConfig get fluid => FluidConfig.of(this);
}
