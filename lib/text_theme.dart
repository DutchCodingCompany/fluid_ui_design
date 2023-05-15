import 'package:flutter/material.dart';

import 'fluid_size.dart';

abstract class FluidUITheme {
  static TextTheme get textTheme => TextTheme(
        displayLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: const FluidSize(min: 16, max: 26).width,
          color: Colors.black,
        ),
        displayMedium: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: const FluidSize(min: 12, max: 22).width,
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: const FluidSize(min: 8, max: 18).width,
          color: Colors.black,
        ),
        headlineLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: const FluidSize(min: 22, max: 32).width,
          color: Colors.blue,
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: const FluidSize(min: 18, max: 28).width,
          color: Colors.blue,
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: const FluidSize(min: 16, max: 26).width,
          color: Colors.blue,
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: const FluidSize(min: 16, max: 26).width,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: const FluidSize(min: 14, max: 24).width,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: const FluidSize(min: 12, max: 22).width,
          color: Colors.black,
        ),
      );
}
