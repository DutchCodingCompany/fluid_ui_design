import 'dart:ui';

import 'package:fluid_ui_design/core/fluid_config_state.dart';
import 'package:fluid_ui_design/core/viewport_config.dart';
import 'package:fluid_ui_design/screen_size_helper.dart';
import 'package:fluid_ui_design/space/space_config.dart';
import 'package:fluid_ui_design/type/fluid_type.dart';
import 'package:fluid_ui_design/type/type_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parameterized_test/parameterized_test.dart';

void main() {
  group('for default settings', () {
    TypeConfig typeConfig = const TypeConfig();

    setUp(() => FluidConfigState.instance.setConfig(const SpaceConfig(), typeConfig, const ViewportConfig()));

    parameterizedTest(
      'Should nicely distribute between min and max',
      [
        /// data generated on https://utopia.fyi/type/calculator?c=320,17,1.2,1500,20,1.333,10,10,910&s=0.75%7C0.5%7C0.25,1.5%7C2%7C3%7C4%7C6,s-l&g=s,l,xl,12
        [10, 105.26, 354.27, 229.76],
        [9, 87.72, 265.77, 176.74],
        [8, 73.10, 199.38, 136.24],
        [7, 60.91, 149.57, 105.24],
        [6, 50.76, 112.20, 81.48],
        [5, 42.30, 84.17, 63.24],
        [4, 35.25, 63.15, 49.20],
        [3, 29.38, 47.37, 38.37],
        [2, 24.48, 35.54, 30.01],
        [1, 20.40, 26.66, 23.53],
        [0, 17.00, 20.00, 18.50],
        [-1, 14.17, 15.00, 14.59],
        [-2, 11.81, 11.26, 11.53],
        [-3, 9.84, 8.44, 9.14],
        [-4, 8.20, 6.33, 7.27],
        [-5, 6.83, 4.75, 5.79],
        [-6, 5.69, 3.56, 4.63],
        [-7, 4.74, 2.67, 3.71],
        [-8, 3.95, 2.01, 2.98],
        [-9, 3.29, 1.51, 2.40],
        [-10, 2.75, 1.13, 1.94]
      ],
      p4((int scaleStep, double minimalSize, double maximalSize, double halfSize) {
        double minimalScreenSize = const ViewportConfig().minViewportSize;
        double maximalScreenSize = const ViewportConfig().maxViewportSize;
        double halfScreenSize = (maximalScreenSize + minimalScreenSize) / 2;

        double verySmallScreenSize = 20;
        double veryLargeScreenSize = 2000;

        ScreenSizeHelper.instance.setWidth(Size(verySmallScreenSize, verySmallScreenSize));
        expect(double.parse(FluidType(scaleStep).space.toStringAsFixed(2)), minimalSize);

        ScreenSizeHelper.instance.setWidth(Size(minimalScreenSize, minimalScreenSize));
        expect(double.parse(FluidType(scaleStep).space.toStringAsFixed(2)), minimalSize);

        ScreenSizeHelper.instance.setWidth(Size(halfScreenSize, halfScreenSize));
        expect(double.parse(FluidType(scaleStep).space.toStringAsFixed(2)), halfSize);

        ScreenSizeHelper.instance.setWidth(Size(maximalScreenSize, maximalScreenSize));
        expect(double.parse(FluidType(scaleStep).space.toStringAsFixed(2)), maximalSize);

        ScreenSizeHelper.instance.setWidth(Size(veryLargeScreenSize, veryLargeScreenSize));
        expect(double.parse(FluidType(scaleStep).space.toStringAsFixed(2)), maximalSize);
      }),
    );
  });
}
