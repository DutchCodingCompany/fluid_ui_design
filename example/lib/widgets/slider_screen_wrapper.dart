import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

class SliderScreenWrapper extends StatelessWidget {
  const SliderScreenWrapper({
    super.key,
    required this.onWidthChangeCallback,
    required this.config,
    required this.child,
  });

  final void Function(double width) onWidthChangeCallback;
  final FluidConfig config;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.fluid.spaces.m),
        Text(
          'Width: ${config.screenWidth}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: context.fluid.spaces.m),
        Slider(
          value: config.screenWidth,
          min: config.viewportConfig.minViewportSize,
          max: config.viewportConfig.maxViewportSize,
          divisions: (config.viewportConfig.maxViewportSize - config.viewportConfig.minViewportSize).round(),
          onChanged: onWidthChangeCallback,
        ),
        SizedBox(height: context.fluid.spaces.m),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.all(context.fluid.spaces.m),
            child: Container(
              width: config.screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
