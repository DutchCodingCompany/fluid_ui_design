import '../core/fluid_size.dart';
import '../core/theme/fluid_config_theme_extension.dart';

class FluidSpace {
  final double spaceModifier;
  final FluidConfig fluidConfig;

  const FluidSpace({required this.fluidConfig, required this.spaceModifier});

  double get min => fluidConfig.spaceConfig.baseMin * spaceModifier;
  double get max => fluidConfig.spaceConfig.baseMax * spaceModifier;

  double get value => FluidSize(fluidConfig: fluidConfig, min: min, max: max).value;
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
