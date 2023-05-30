import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../fluid_ui_design.dart';

extension TextScaleExtension on ThemeData {
  TextScaleHelper fromGoogleFont(
          TextStyle Function({
            TextStyle? textStyle,
            Color? color,
            Color? backgroundColor,
            double? fontSize,
            FontWeight? fontWeight,
            FontStyle? fontStyle,
            double? letterSpacing,
            double? wordSpacing,
            TextBaseline? textBaseline,
            double? height,
            Locale? locale,
            Paint? foreground,
            Paint? background,
            List<Shadow>? shadows,
            List<FontFeature>? fontFeatures,
            TextDecoration? decoration,
            Color? decorationColor,
            TextDecorationStyle? decorationStyle,
            double? decorationThickness,
          }) googleFontFunction) =>
      extension<FluidConfig>()!.fromGoogleFont(googleFontFunction);
}

extension TextScaleConfigExtension on FluidConfig {
  TextScaleHelper fromGoogleFont(
      TextStyle Function({
        TextStyle? textStyle,
        Color? color,
        Color? backgroundColor,
        double? fontSize,
        FontWeight? fontWeight,
        FontStyle? fontStyle,
        double? letterSpacing,
        double? wordSpacing,
        TextBaseline? textBaseline,
        double? height,
        Locale? locale,
        Paint? foreground,
        Paint? background,
        List<Shadow>? shadows,
        List<FontFeature>? fontFeatures,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness,
      }) googleFontFunction) {
    return TextScaleHelper(
      this,
      ({required FontWeight fontWeight, required double fontSize, required Color color}) =>
          googleFontFunction(fontWeight: fontWeight, fontSize: fontSize, color: color),
    );
  }
}
