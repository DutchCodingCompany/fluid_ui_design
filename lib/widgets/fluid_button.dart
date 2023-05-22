import 'package:flutter/material.dart';

import '../fluid_size.dart';
import '../space/fluid_space.dart';
import '../text_theme.dart';

class FluidButton extends StatelessWidget {
  const FluidButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: const FluidSize(min: 100, max: 300).width,
      height: FluidSpaces.l,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FluidSpaces.l)),
        ),
        onPressed: onPressed,
        child: Text(
          'Fluid button with height: ${FluidUITheme.textTheme.bodyMedium?.fontSize?.toStringAsFixed(1)}',
          style: FluidUITheme.textTheme.bodySmall?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
