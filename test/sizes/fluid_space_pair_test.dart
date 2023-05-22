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
        //data generated on https://utopia.fyi/space/calculator?c=320,17,1.2,1500,20,1.333,10,10,910&s=0.75%7C0.5%7C0.25,1.5%7C2%7C3%7C4%7C6,s-l&g=s,l,xl,12
        [spaceConfig.xxxsModifier, spaceConfig.xxsModifier, 4, 10, 7],
        [spaceConfig.xxsModifier, spaceConfig.xsModifier, 9, 15, 12],
        [spaceConfig.xsModifier, spaceConfig.sModifier, 13, 20, 16],
        [spaceConfig.sModifier, spaceConfig.mModifier, 17, 30, 24],
        [spaceConfig.mModifier, spaceConfig.lModifier, 26, 40, 33],
        [spaceConfig.lModifier, spaceConfig.xlModifier, 34, 60, 47],
        [spaceConfig.xlModifier, spaceConfig.xxlModifier, 51, 80, 66],
        [spaceConfig.xxlModifier, spaceConfig.xxxlModifier, 68, 120, 94],
        [spaceConfig.sModifier, spaceConfig.lModifier, 17, 40, 29],
        [spaceConfig.lModifier, spaceConfig.sModifier, 34, 20, 27],
      ],
      p5((double spaceModifierStart, double spaceModifierEnd, int minimalSize, int maximalSize, int halfSize) {
        double minimalScreenSize = const ViewportConfig().minViewportSize;
        double maximalScreenSize = const ViewportConfig().maxViewportSize;
        double halfScreenSize = (maximalScreenSize + minimalScreenSize) / 2;

        double verySmallScreenSize = 20;
        double veryLargeScreenSize = 2000;

        ScreenSizeHelper.instance.setWidth(Size(verySmallScreenSize, verySmallScreenSize));
        expect(
            FluidSpacePair(
                    start: FluidSpace(spaceModifier: spaceModifierStart),
                    end: FluidSpace(spaceModifier: spaceModifierEnd))
                .value
                .round(),
            minimalSize);

        ScreenSizeHelper.instance.setWidth(Size(minimalScreenSize, minimalScreenSize));
        expect(
            FluidSpacePair(
                    start: FluidSpace(spaceModifier: spaceModifierStart),
                    end: FluidSpace(spaceModifier: spaceModifierEnd))
                .value
                .round(),
            minimalSize);

        ScreenSizeHelper.instance.setWidth(Size(halfScreenSize, halfScreenSize));
        expect(
            FluidSpacePair(
                    start: FluidSpace(spaceModifier: spaceModifierStart),
                    end: FluidSpace(spaceModifier: spaceModifierEnd))
                .value
                .round(),
            halfSize);

        ScreenSizeHelper.instance.setWidth(Size(maximalScreenSize, maximalScreenSize));
        expect(
            FluidSpacePair(
                    start: FluidSpace(spaceModifier: spaceModifierStart),
                    end: FluidSpace(spaceModifier: spaceModifierEnd))
                .value
                .round(),
            maximalSize);

        ScreenSizeHelper.instance.setWidth(Size(veryLargeScreenSize, veryLargeScreenSize));
        expect(
            FluidSpacePair(
                    start: FluidSpace(spaceModifier: spaceModifierStart),
                    end: FluidSpace(spaceModifier: spaceModifierEnd))
                .value
                .round(),
            maximalSize);
      }),
    );
  });
}
