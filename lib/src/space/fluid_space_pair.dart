import '../core/fluid_size.dart';
import 'fluid_space.dart';

class FluidSpacePair {
  final FluidSpace start;
  final FluidSpace end;

  const FluidSpacePair({required this.start, required this.end});

  double get value => FluidSize(min: start.min, max: end.max).value;
}
