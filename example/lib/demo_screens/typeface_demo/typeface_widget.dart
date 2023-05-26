import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

class TypefaceWidget extends StatelessWidget {
  final TextStyle textStyle;
  final String textStyleName;
  final String testTextString;

  final FluidConfig? config;

  const TypefaceWidget(
      {super.key, required this.textStyle, required this.textStyleName, required this.testTextString, this.config});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(testTextString, style: textStyle),
        const Divider(),
        Text(textStyleName, style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: config?.fontSize(1))),
        Text(textStyle.fontFamily!,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: config?.fontSize(1))),
        Text(textStyle.fontWeight.toString(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: config?.fontSize(1))),
        Text(textStyle.fontSize.toString(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: config?.fontSize(1)))
      ],
    );
  }
}
