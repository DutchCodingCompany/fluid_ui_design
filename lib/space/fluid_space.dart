import '../core/fluid_config_state.dart';
import '../fluid_size.dart';

class FluidSpace {
  final double spaceModifier;

  const FluidSpace({required this.spaceModifier});

  double get min => FluidConfigState.instance.spaceConfig.baseMin * spaceModifier;
  double get max => FluidConfigState.instance.spaceConfig.baseMax * spaceModifier;

  double get space => FluidSize(min: min, max: max).width;
}

class FluidSpaces {
  static double get xxxs => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.xxxsModifier).space;
  static double get xxs => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.xxsModifier).space;
  static double get xs => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.xsModifier).space;
  static double get s => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.sModifier).space;
  static double get m => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.mModifier).space;
  static double get l => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.lModifier).space;
  static double get xl => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.xlModifier).space;
  static double get xxl => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.xxlModifier).space;
  static double get xxxl => FluidSpace(spaceModifier: FluidConfigState.instance.spaceConfig.xxxlModifier).space;
}
