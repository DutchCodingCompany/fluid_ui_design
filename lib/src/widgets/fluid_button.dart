import 'package:flutter/material.dart';

import '../../fluid_ui_design.dart';

class FluidButton extends StatelessWidget {
  const FluidButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.fluid.size(min: 100, max: 300),
      height: context.fluid.spaces.l,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.fluid.spaces.l)),
        ),
        onPressed: onPressed,
        child: Text(
          'Fluid button with height: ${Theme.of(context).textTheme.bodyMedium?.fontSize?.toStringAsFixed(1)}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
