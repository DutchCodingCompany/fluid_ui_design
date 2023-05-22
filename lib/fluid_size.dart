import 'package:fluid_ui_design/core/fluid_config_state.dart';
import 'package:fluid_ui_design/screen_size_helper.dart';

class FluidSize {
  const FluidSize({required this.min, required this.max});

  double get minViewportWidth =>
      FluidConfigState.instance.viewportConfig.minViewportSize; //Minimal threshold -> Small phone width
  double get maxViewportWidth =>
      FluidConfigState.instance.viewportConfig.maxViewportSize; //Maximal threshold -> Desktop width

  final double min;
  final double max;

  /// Calculates the size of a given [FluidSize] between its [min] and [max] for the current device's screenwidth
  double get width {
    double slope = (max - min) / (maxViewportWidth - minViewportWidth);
    double yIntersect = min - (slope * minViewportWidth);
    double size = yIntersect + (slope * screenWidth);

    return size > max
        ? max
        : size < min
            ? min
            : size;
  }
}
