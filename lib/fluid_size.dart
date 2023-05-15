import 'package:fluid_ui_design/screen_size_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fluid_size.freezed.dart';

@freezed
class FluidSize with _$FluidSize {
  const FluidSize._();
  static const double minViewportWidth = 320;   //Minimal threshold -> Small phone width
  static const double maxViewportWidth = 1500;  //Maximal threshold -> Desktop width

  const factory FluidSize({
    required double min,
    required double max,
  }) = _FluidSize;

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

class FluidSizes {
  /// 2 - 8
  static double get xxs => const FluidSize(min: 2, max: 8).width;

  /// 4 - 16
  static double get xs => const FluidSize(min: 4, max: 16).width;

  /// 8 - 24
  static double get s => const FluidSize(min: 8, max: 24).width;

  /// 16 - 32
  static double get m => const FluidSize(min: 16, max: 32).width;

  /// 24 - 48
  static double get l => const FluidSize(min: 24, max: 48).width;

  /// 32 - 64
  static double get xl => const FluidSize(min: 32, max: 64).width;

  /// 48 - 96
  static double get xxl => const FluidSize(min: 48, max: 96).width;

  /// 64 - 128
  static double get xxxl => const FluidSize(min: 64, max: 128).width;
}
