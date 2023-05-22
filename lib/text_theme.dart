import 'package:flutter/material.dart';

import 'type/fluid_type.dart';

abstract class FluidUITheme {
  static TextTheme get textTheme => TextTheme(
        displayLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: const FluidType(9).space,
          color: Colors.black,
        ),
        displayMedium: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: const FluidType(8).space,
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: const FluidType(7).space,
          color: Colors.black,
        ),
        headlineLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: const FluidType(6).space,
          color: Colors.blue,
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: const FluidType(5).space,
          color: Colors.blue,
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: const FluidType(4).space,
          color: Colors.blue,
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: const FluidType(3).space,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: const FluidType(2).space,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: const FluidType(1).space,
          color: Colors.black,
        ),
      );
}
