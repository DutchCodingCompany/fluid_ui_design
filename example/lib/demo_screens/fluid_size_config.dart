import 'package:fluid_ui_design/fluid_ui_design.dart';

class FluidSizeConfig {
  final FluidSizeType type;

  final String? spaceModifier;
  final double? minSize;
  final double? maxSize;
  final String? startSpaceModifier;
  final String? endSpaceModifier;

  FluidSizeConfig(
      {required this.type,
      this.spaceModifier,
      this.minSize,
      this.maxSize,
      this.startSpaceModifier,
      this.endSpaceModifier});

  FluidSizeConfig.space(String spaceModifier)
      : this(
          type: FluidSizeType.space,
          spaceModifier: spaceModifier,
        );

  FluidSizeConfig.spacePair(String startSpaceModifier, String endSpaceModifier)
      : this(
          type: FluidSizeType.spacePair,
          startSpaceModifier: startSpaceModifier,
          endSpaceModifier: endSpaceModifier,
        );

  FluidSizeConfig.size(double minSize, double maxSize)
      : this(
          type: FluidSizeType.size,
          minSize: minSize,
          maxSize: maxSize,
        );

  FluidSizeConfig copyWith({
    FluidSizeType? type,
    String? spaceModifier,
    double? minSize,
    double? maxSize,
    String? startSpaceModifier,
    String? endSpaceModifier,
  }) {
    return FluidSizeConfig(
      type: type ?? this.type,
      spaceModifier: spaceModifier ?? this.spaceModifier,
      minSize: minSize ?? this.minSize,
      maxSize: maxSize ?? this.maxSize,
      startSpaceModifier: startSpaceModifier ?? this.startSpaceModifier,
      endSpaceModifier: endSpaceModifier ?? this.endSpaceModifier,
    );
  }

  double getSize(FluidConfig config) {
    switch (type) {
      case FluidSizeType.size:
        return FluidSize(fluidConfig: config, min: minSize!, max: maxSize!).value;
      case FluidSizeType.space:
        return getSpaceForModifier(config, spaceModifier!).value;
      case FluidSizeType.spacePair:
        return FluidSpacePair(
                fluidConfig: config,
                start: getSpaceForModifier(config, startSpaceModifier!),
                end: getSpaceForModifier(config, endSpaceModifier!))
            .value;
    }
  }

  FluidSpace getSpaceForModifier(FluidConfig config, String modifier) {
    switch (modifier) {
      case 'xxxs':
        return FluidSpace(fluidConfig: config, spaceModifier: config.spaceConfig.xxxsModifier);
      case 'xxs':
        return FluidSpace(fluidConfig: config, spaceModifier: config.spaceConfig.xxsModifier);
      case 'xs':
        return FluidSpace(fluidConfig: config, spaceModifier: config.spaceConfig.xsModifier);
      case 's':
        return FluidSpace(fluidConfig: config, spaceModifier: config.spaceConfig.sModifier);
      case 'm':
        return FluidSpace(fluidConfig: config, spaceModifier: config.spaceConfig.mModifier);
      case 'l':
        return FluidSpace(fluidConfig: config, spaceModifier: config.spaceConfig.lModifier);
      case 'xl':
        return FluidSpace(fluidConfig: config, spaceModifier: config.spaceConfig.xlModifier);
      case 'xxl':
        return FluidSpace(fluidConfig: config, spaceModifier: config.spaceConfig.xxlModifier);
      case 'xxxl':
        return FluidSpace(fluidConfig: config, spaceModifier: config.spaceConfig.xxxlModifier);
      default:
        return FluidSpace(fluidConfig: config, spaceModifier: config.spaceConfig.mModifier);
    }
  }
}

enum FluidSizeType {
  size,
  space,
  spacePair;
}
