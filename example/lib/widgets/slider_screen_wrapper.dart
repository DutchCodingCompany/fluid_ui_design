import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

class SliderScreenWrapper extends StatefulWidget {
  const SliderScreenWrapper(
      {super.key,
      required this.enabled,
      required this.builder,
      required this.minimalScreenSize,
      required this.maximalScreenSize,
      required this.config});

  final bool enabled;
  final Widget Function(BuildContext context, FluidConfig config) builder;
  final double minimalScreenSize;
  final double maximalScreenSize;
  final FluidConfig config;

  @override
  State<SliderScreenWrapper> createState() => _SliderScreenWrapperState();
}

class _SliderScreenWrapperState extends State<SliderScreenWrapper> {
  late double screenSize;

  @override
  void initState() {
    super.initState();
    screenSize = widget.minimalScreenSize + (widget.maximalScreenSize - widget.minimalScreenSize) / 2;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.enabled) {
      return widget.builder.call(context, widget.config);
    }

    return Column(
      children: [
        SizedBox(height: context.fluid.spaces.m),
        Text(
          'Screen size',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: context.fluid.spaces.s),
        Slider(
          value: screenSize,
          min: widget.minimalScreenSize,
          max: widget.maximalScreenSize,
          onChanged: (value) => setState(() {
            screenSize = value;
          }),
        ),
        SizedBox(height: context.fluid.spaces.m),
        SizedBox(
            width: screenSize, child: widget.builder.call(context, widget.config.copyWith(screenWidth: screenSize))),
      ],
    );
  }
}
