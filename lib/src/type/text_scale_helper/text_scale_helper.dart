import 'package:flutter/material.dart';

import '../../../fluid_ui_design.dart';

class TextScaleHelper {
  final FluidConfig config;

  final Color textColor;
  final bool isBold;

  final TextStyle Function({required FontWeight fontWeight, required double fontSize, required Color color})
      getTextStyle;

  TextScaleHelper(this.config, this.getTextStyle, {this.isBold = false, this.textColor = Colors.black});
  TextScaleHelper get bold => TextScaleHelper(config, getTextStyle, isBold: true, textColor: textColor);
  TextScaleHelper withColor(Color color) => TextScaleHelper(config, getTextStyle, isBold: true, textColor: color);

  TextStyle _getTextStyleForTypeSize(int typeSize) => getTextStyle(
        fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
        fontSize: config.typeSize(typeSize),
        color: textColor,
      );

  TextStyle get displayLarge => _getTextStyleForTypeSize(9);
  TextStyle get displayMedium => _getTextStyleForTypeSize(8);
  TextStyle get displaySmall => _getTextStyleForTypeSize(7);

  TextStyle get headlineLarge => _getTextStyleForTypeSize(6);
  TextStyle get headlineMedium => _getTextStyleForTypeSize(5);
  TextStyle get headlineSmall => _getTextStyleForTypeSize(4);

  TextStyle get bodyLarge => _getTextStyleForTypeSize(3);
  TextStyle get bodyMedium => _getTextStyleForTypeSize(2);
  TextStyle get bodySmall => _getTextStyleForTypeSize(1);
}
