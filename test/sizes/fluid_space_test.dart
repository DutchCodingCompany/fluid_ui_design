import 'dart:ui';

import 'package:fluid_ui_design/core/fluid_config_state.dart';
import 'package:fluid_ui_design/core/viewport_config.dart';
import 'package:fluid_ui_design/screen_size_helper.dart';
import 'package:fluid_ui_design/space/fluid_space.dart';
import 'package:fluid_ui_design/space/space_config.dart';
import 'package:fluid_ui_design/type/type_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parameterized_test/parameterized_test.dart';

void main() {
  group('for default settings', () {
    SpaceConfig spaceConfig = const SpaceConfig();

    setUp(() => FluidConfigState.instance.setConfig(spaceConfig, const TypeConfig(), const ViewportConfig()));

    parameterizedTest(
      'Should nicely distribute between min and max',
      [
        //todo: add test sets for other default modifiers
        [spaceConfig.xxxsModifier, 320.0, 5.25],
        [spaceConfig.xxxsModifier, 1500.0, 6.0],
        [spaceConfig.xxxsModifier, 910.0, 5.625],
        [spaceConfig.xxxsModifier, 0.0, 5.25],
        [spaceConfig.xxxsModifier, 2000.0, 6.0]
      ],
      p3((double spaceModifier, double screenSize, double expectedSize) {
        ScreenSizeHelper.instance.setWidth(Size(screenSize, screenSize));

        expect(FluidSpace(spaceModifier: spaceModifier).space, expectedSize);
      }),
    );
  });
}
