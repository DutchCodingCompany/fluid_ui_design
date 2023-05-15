import 'package:fluid_ui_design/fluid_size.dart';
import 'package:fluid_ui_design/text_theme.dart';
import 'package:flutter/material.dart';

class FluidButton extends StatelessWidget {
  const FluidButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: const FluidSize(min: 100, max: 300).width,
      height: FluidSizes.l,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FluidSizes.l)),
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
