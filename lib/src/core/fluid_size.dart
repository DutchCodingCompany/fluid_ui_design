import '../../fluid_ui_design.dart';

class FluidSize {
  const FluidSize({required this.fluidConfig, required this.min, required this.max});

  double get minViewportWidth => fluidConfig.viewportConfig.minViewportSize; //Minimal threshold -> Small phone width
  double get maxViewportWidth => fluidConfig.viewportConfig.maxViewportSize; //Maximal threshold -> Desktop width

  final double min;
  final double max;
  final FluidConfig fluidConfig;

  /// Calculates the size of a given [FluidSize] between its [min] and [max] for the current device's screenwidth
  double get value {
    if (fluidConfig.screenWidth >= maxViewportWidth) return max;
    if (fluidConfig.screenWidth <= minViewportWidth) return min;

    double slope = (max - min) / (maxViewportWidth - minViewportWidth);
    double yIntersect = min - (slope * minViewportWidth);
    double size = yIntersect + (slope * fluidConfig.screenWidth);

    return size;
  }
}
