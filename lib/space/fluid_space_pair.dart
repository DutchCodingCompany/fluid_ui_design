import '../fluid_size.dart';
import 'fluid_space.dart';

class FluidSpacePair {
  final FluidSpace start;
  final FluidSpace end;

  const FluidSpacePair({required this.start, required this.end});

  double get space => FluidSize(min: start.min, max: end.max).width;
}
