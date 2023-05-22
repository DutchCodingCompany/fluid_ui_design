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
        //data generated on https://utopia.fyi/space/calculator?c=320,17,1.2,1500,20,1.333,10,10,910&s=0.75%7C0.5%7C0.25,1.5%7C2%7C3%7C4%7C6,s-l&g=s,l,xl,12
        [spaceConfig.xxxsModifier, 4, 5, 5],
        [spaceConfig.xxsModifier, 9, 10, 9],
        [spaceConfig.xsModifier, 13, 15, 14],
        [spaceConfig.sModifier, 17, 20, 19],
        [spaceConfig.mModifier, 26, 30, 28],
        [spaceConfig.lModifier, 34, 40, 37],
        [spaceConfig.xlModifier, 51, 60, 56],
        [spaceConfig.xxlModifier, 68, 80, 74],
        [spaceConfig.xxxlModifier, 102, 120, 111],
      ],
      p4((double spaceModifier, int minimalSize, int maximalSize, int halfSize) {
        double minimalScreenSize = const ViewportConfig().minViewportSize;
        double maximalScreenSize = const ViewportConfig().maxViewportSize;
        double halfScreenSize = (maximalScreenSize + minimalScreenSize) / 2;

        double verySmallScreenSize = 20;
        double veryLargeScreenSize = 2000;

        ScreenSizeHelper.instance.setWidth(Size(verySmallScreenSize, verySmallScreenSize));
        expect(FluidSpace(spaceModifier: spaceModifier).value.round(), minimalSize);

        ScreenSizeHelper.instance.setWidth(Size(minimalScreenSize, minimalScreenSize));
        expect(FluidSpace(spaceModifier: spaceModifier).value.round(), minimalSize);

        ScreenSizeHelper.instance.setWidth(Size(halfScreenSize, halfScreenSize));
        expect(FluidSpace(spaceModifier: spaceModifier).value.round(), halfSize);

        ScreenSizeHelper.instance.setWidth(Size(maximalScreenSize, maximalScreenSize));
        expect(FluidSpace(spaceModifier: spaceModifier).value.round(), maximalSize);

        ScreenSizeHelper.instance.setWidth(Size(veryLargeScreenSize, veryLargeScreenSize));
        expect(FluidSpace(spaceModifier: spaceModifier).value.round(), maximalSize);
      }),
    );
  });
}
