import 'dart:ui';

import 'package:fluid_ui_design/core/fluid_config_state.dart';
import 'package:fluid_ui_design/core/viewport_config.dart';
import 'package:fluid_ui_design/screen_size_helper.dart';
import 'package:fluid_ui_design/space/fluid_space.dart';
import 'package:fluid_ui_design/space/fluid_space_pair.dart';
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
        //todo: add test sets for other combinations
        [spaceConfig.xxxsModifier, spaceConfig.xxxlModifier, 320.0, 5.25],
        [spaceConfig.xxxsModifier, spaceConfig.xxxlModifier, 1500.0, 144.0],
        [spaceConfig.xxxsModifier, spaceConfig.xxxlModifier, 910.0, 74.625],
        [spaceConfig.xxxsModifier, spaceConfig.xxxlModifier, 0.0, 5.25],
        [spaceConfig.xxxsModifier, spaceConfig.xxxlModifier, 2000.0, 144.0]
      ],
      p4((double spaceModifierStart, double spaceModifierEnd, double screenSize, double expectedSize) {
        ScreenSizeHelper.instance.setWidth(Size(screenSize, screenSize));

        expect(
            FluidSpacePair(
                    start: FluidSpace(spaceModifier: spaceModifierStart),
                    end: FluidSpace(spaceModifier: spaceModifierEnd))
                .space,
            expectedSize);
      }),
    );
  });
}
