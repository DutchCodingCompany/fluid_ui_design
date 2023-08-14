import '../core/fluid_size.dart';
import '../core/theme/fluid_config_theme_extension.dart';

class FluidSpace {
  final double spaceModifier;
  final FluidConfig fluidConfig;

  const FluidSpace({required this.fluidConfig, required this.spaceModifier});

  double get min => fluidConfig.spaceConfig.baseMin * spaceModifier;
  double get max => fluidConfig.spaceConfig.baseMax * spaceModifier;

  double get value => FluidSize(fluidConfig: fluidConfig, min: min, max: max).value;

  toHelper get to => toHelper(fluidConfig, this);
}

class FluidSpaces {
  final FluidConfig fluidConfig;

  const FluidSpaces(this.fluidConfig);

  double get xxxs => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xxxsModifier).value;
  double get xxs => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xxsModifier).value;
  double get xs => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xsModifier).value;
  double get s => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.sModifier).value;
  double get m => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.mModifier).value;
  double get l => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.lModifier).value;
  double get xl => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xlModifier).value;
  double get xxl => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xxlModifier).value;
  double get xxxl => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xxxlModifier).value;
}

class FluidSpaceHelper {
  final FluidConfig fluidConfig;
  const FluidSpaceHelper(this.fluidConfig);

  FluidSpaceHelper get from => FluidSpaceHelper(fluidConfig);

  FluidSpace get zero => FluidSpace(fluidConfig: fluidConfig, spaceModifier: 0);
  FluidSpace get xxxs => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xxxsModifier);
  FluidSpace get xxs => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xxsModifier);
  FluidSpace get xs => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xsModifier);
  FluidSpace get s => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.sModifier);
  FluidSpace get m => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.mModifier);
  FluidSpace get l => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.lModifier);
  FluidSpace get xl => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xlModifier);
  FluidSpace get xxl => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xxlModifier);
  FluidSpace get xxxl => FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xxxlModifier);
}

class toHelper {
  final FluidConfig fluidConfig;
  final FluidSpace from;

  const toHelper(this.fluidConfig, this.from);

  double get zero => FluidSize(
          fluidConfig: fluidConfig, min: from.min, max: FluidSpace(fluidConfig: fluidConfig, spaceModifier: 0).max)
      .value;

  double get xxxs => FluidSize(
          fluidConfig: fluidConfig,
          min: from.min,
          max: FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xxxsModifier).max)
      .value;
  double get xxs => FluidSize(
          fluidConfig: fluidConfig,
          min: from.min,
          max: FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xxsModifier).max)
      .value;
  double get xs => FluidSize(
          fluidConfig: fluidConfig,
          min: from.min,
          max: FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xsModifier).max)
      .value;
  double get s => FluidSize(
          fluidConfig: fluidConfig,
          min: from.min,
          max: FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.sModifier).max)
      .value;
  double get m => FluidSize(
          fluidConfig: fluidConfig,
          min: from.min,
          max: FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.mModifier).max)
      .value;
  double get l => FluidSize(
          fluidConfig: fluidConfig,
          min: from.min,
          max: FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.lModifier).max)
      .value;
  double get xl => FluidSize(
          fluidConfig: fluidConfig,
          min: from.min,
          max: FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xlModifier).max)
      .value;
  double get xxl => FluidSize(
          fluidConfig: fluidConfig,
          min: from.min,
          max: FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xxlModifier).max)
      .value;
  double get xxxl => FluidSize(
          fluidConfig: fluidConfig,
          min: from.min,
          max: FluidSpace(fluidConfig: fluidConfig, spaceModifier: fluidConfig.spaceConfig.xxxlModifier).max)
      .value;
}
