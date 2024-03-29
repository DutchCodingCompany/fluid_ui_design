import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parameterized_test/parameterized_test.dart';

void main() {
  group('for default settings', () {
    SpaceConfig spaceConfig = const SpaceConfig();

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

        FluidConfig config;

        config = FluidConfig(verySmallScreenSize,
            typeConfig: const TypeConfig(minBaseFontSize: 17, maxBaseFontSize: 20),
            spaceConfig: const SpaceConfig(baseMin: 17, baseMax: 20));
        expect(FluidSpace(fluidConfig: config, spaceModifier: spaceModifier).value.round(), minimalSize);

        config = FluidConfig(minimalScreenSize,
            typeConfig: const TypeConfig(minBaseFontSize: 17, maxBaseFontSize: 20),
            spaceConfig: const SpaceConfig(baseMin: 17, baseMax: 20));
        expect(FluidSpace(fluidConfig: config, spaceModifier: spaceModifier).value.round(), minimalSize);

        config = FluidConfig(halfScreenSize,
            typeConfig: const TypeConfig(minBaseFontSize: 17, maxBaseFontSize: 20),
            spaceConfig: const SpaceConfig(baseMin: 17, baseMax: 20));
        expect(FluidSpace(fluidConfig: config, spaceModifier: spaceModifier).value.round(), halfSize);

        config = FluidConfig(maximalScreenSize,
            typeConfig: const TypeConfig(minBaseFontSize: 17, maxBaseFontSize: 20),
            spaceConfig: const SpaceConfig(baseMin: 17, baseMax: 20));
        expect(FluidSpace(fluidConfig: config, spaceModifier: spaceModifier).value.round(), maximalSize);

        config = FluidConfig(veryLargeScreenSize,
            typeConfig: const TypeConfig(minBaseFontSize: 17, maxBaseFontSize: 20),
            spaceConfig: const SpaceConfig(baseMin: 17, baseMax: 20));
        expect(FluidSpace(fluidConfig: config, spaceModifier: spaceModifier).value.round(), maximalSize);
      }),
    );
  });
}
