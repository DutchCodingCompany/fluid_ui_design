import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import '../../util/widget_list_extension.dart';
import 'typeface_widget.dart';

class TypefaceScaleWidget extends StatelessWidget {
  const TypefaceScaleWidget({super.key, required this.textScaleHelper, this.config});

  final FluidConfig? config;
  final TextScaleHelper textScaleHelper;
  final String testTextString = 'The quick brown fox jumps over the lazy dog';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.fluid.spaces.m),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TypefaceWidget(
                config: config,
                textStyle: textScaleHelper.displayLarge,
                textStyleName: 'Display Large',
                testTextString: testTextString),
            TypefaceWidget(
                config: config,
                textStyle: textScaleHelper.displayMedium,
                textStyleName: 'Display Medium',
                testTextString: testTextString),
            TypefaceWidget(
                config: config,
                textStyle: textScaleHelper.displaySmall,
                textStyleName: 'Display Small',
                testTextString: testTextString),
            TypefaceWidget(
                config: config,
                textStyle: textScaleHelper.headlineLarge,
                textStyleName: 'Headline Large',
                testTextString: testTextString),
            TypefaceWidget(
                config: config,
                textStyle: textScaleHelper.headlineMedium,
                textStyleName: 'Headline Medium',
                testTextString: testTextString),
            TypefaceWidget(
                config: config,
                textStyle: textScaleHelper.headlineSmall,
                textStyleName: 'Headline Small',
                testTextString: testTextString),
            TypefaceWidget(
                config: config,
                textStyle: textScaleHelper.bodyLarge,
                textStyleName: 'Body Large',
                testTextString: testTextString),
            TypefaceWidget(
                config: config,
                textStyle: textScaleHelper.bodyMedium,
                textStyleName: 'Body Medium',
                testTextString: testTextString),
            TypefaceWidget(
                config: config,
                textStyle: textScaleHelper.bodySmall,
                textStyleName: 'Body Small',
                testTextString: testTextString),
          ].withSeperator(SizedBox(
            height: context.fluid.spaces.l,
          ))
            ..removeLast()),
    );
  }
}
