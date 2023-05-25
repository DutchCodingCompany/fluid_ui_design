import 'package:fluid_ui_design/src/core/fluid_size.dart';
import 'package:fluid_ui_design/src/core/theme/fluid_config_theme_extension.dart';
import 'package:fluid_ui_design/src/core/viewport_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parameterized_test/parameterized_test.dart';

void main() {
  group('for default settings', () {
    parameterizedTest(
      'Should nicely distribute between min and max',
      [
        [320.0, 100.0],
        [1500.0, 200.0],
        [910.0, 150.0],
        [0.0, 100.0],
        [2000.0, 200.0]
      ],
      p2((double screenSize, double expectedSize) {
        FluidConfig config = FluidConfig(screenSize);
        FluidSize size = FluidSize(fluidConfig: config, min: 100, max: 200);

        expect(size.value, expectedSize);
      }),
    );

    parameterizedTest(
      'Also works when max is smaller then min',
      [
        [320.0, 200.0],
        [1500.0, 100.0],
        [910.0, 150.0],
        [0.0, 200.0],
        [2000.0, 100.0]
      ],
      p2((double screenSize, double expectedSize) {
        FluidConfig config = FluidConfig(screenSize);
        FluidSize size = FluidSize(fluidConfig: config, min: 200, max: 100);

        expect(size.value, expectedSize);
      }),
    );
  });

  group('with custom viewport settings', () {
    parameterizedTest(
      'Should nicely distribute between min and max',
      [
        [200.0, 100.0],
        [1000.0, 200.0],
        [600.0, 150.0],
        [0.0, 100.0],
        [2000.0, 200.0]
      ],
      p2((double screenSize, double expectedSize) {
        FluidConfig config =
            FluidConfig(screenSize, viewportConfig: const ViewportConfig(minViewportSize: 200, maxViewportSize: 1000));
        FluidSize size = FluidSize(fluidConfig: config, min: 100, max: 200);
        expect(size.value, expectedSize);
      }),
    );
  });
}
