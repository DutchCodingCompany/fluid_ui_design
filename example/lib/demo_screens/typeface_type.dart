import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

enum TypefaceType {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  bodyLarge,
  bodyMedium,
  bodySmall;

  TextStyle getTextStyleForType(TextScaleHelper helper) {
    return switch (this) {
      displayLarge => helper.displayLarge,
      displayMedium => helper.displayMedium,
      displaySmall => helper.displaySmall,
      headlineLarge => helper.headlineLarge,
      headlineMedium => helper.headlineMedium,
      headlineSmall => helper.headlineSmall,
      bodyLarge => helper.bodyLarge,
      bodyMedium => helper.bodyMedium,
      bodySmall => helper.bodySmall,
    };
  }
}
