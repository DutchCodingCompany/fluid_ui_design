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
        //todo: add test sets for other steps in -10 / 10 range.
        [0, 320.0, 17.0],
        [0, 1500.0, 20.0],
        [0, 910.0, 18.5],
        [0, 0.0, 17.0],
        [0, 2000.0, 20.0]
      ],
      p3((int scaleStep, double screenSize, double expectedSize) {
        ScreenSizeHelper.instance.setWidth(Size(screenSize, screenSize));

        expect(FluidType(scaleStep).space, expectedSize);
      }),
    );
  });
}
