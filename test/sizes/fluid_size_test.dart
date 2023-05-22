import 'dart:ui';

import 'package:fluid_ui_design/core/fluid_config_state.dart';
import 'package:fluid_ui_design/core/viewport_config.dart';
import 'package:fluid_ui_design/fluid_size.dart';
import 'package:fluid_ui_design/screen_size_helper.dart';
import 'package:fluid_ui_design/space/space_config.dart';
import 'package:fluid_ui_design/type/type_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parameterized_test/parameterized_test.dart';

void main() {
  group('for default settings', () {
    setUp(() => FluidConfigState.instance.setConfig(const SpaceConfig(), const TypeConfig(), const ViewportConfig()));

    const FluidSize size = FluidSize(min: 100, max: 200);

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
        ScreenSizeHelper.instance.setWidth(Size(screenSize, screenSize));

        expect(size.value, expectedSize);
      }),
    );

    const FluidSize shrinkingSize = FluidSize(min: 200, max: 100);

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
        ScreenSizeHelper.instance.setWidth(Size(screenSize, screenSize));

        expect(shrinkingSize.value, expectedSize);
      }),
    );
  });

  group('with custom viewport settings', () {
    setUp(() => FluidConfigState.instance.setConfig(
        const SpaceConfig(), const TypeConfig(), const ViewportConfig(minViewportSize: 200, maxViewportSize: 1000)));

    const FluidSize size = FluidSize(min: 100, max: 200);

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
        ScreenSizeHelper.instance.setWidth(Size(screenSize, screenSize));

        expect(size.value, expectedSize);
      }),
    );
  });
}
