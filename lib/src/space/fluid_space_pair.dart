import '../../fluid_ui_design.dart';

class FluidSpacePair {
  final FluidSpace start;
  final FluidSpace end;
  final FluidConfig fluidConfig;

  const FluidSpacePair({required this.fluidConfig, required this.start, required this.end});

  double get value => FluidSize(fluidConfig: fluidConfig, min: start.min, max: end.max).value;
}
