import '../core/fluid_config_state.dart';
import '../fluid_size.dart';

class FluidSpace {
  final double spaceModifier;

  const FluidSpace({required this.spaceModifier});

  double get min => FluidConfigState.instance.spaceConfig.baseMin * spaceModifier;
  double get max => FluidConfigState.instance.spaceConfig.baseMax * spaceModifier;

  double get value => FluidSize(min: min, max: max).value;
}

class FluidSpaces {
  static double get xxxs => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.xxxsModifier).value;
  static double get xxs => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.xxsModifier).value;
  static double get xs => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.xsModifier).value;
  static double get s => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.sModifier).value;
  static double get m => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.mModifier).value;
  static double get l => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.lModifier).value;
  static double get xl => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.xlModifier).value;
  static double get xxl => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.xxlModifier).value;
  static double get xxxl => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.xxxlModifier).value;
}
