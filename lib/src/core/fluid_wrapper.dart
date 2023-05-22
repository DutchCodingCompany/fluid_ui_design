import 'package:flutter/material.dart';

import 'screen_size_helper.dart';
import '../space/space_config.dart';
import '../type/type_config.dart';
import 'fluid_config_state.dart';
import 'viewport_config.dart';

class FluidWrapper extends StatelessWidget {
  const FluidWrapper({
    super.key,
    required this.child,
    this.spaceConfig = const SpaceConfig(),
    this.typeConfig = const TypeConfig(),
    this.viewportConfig = const ViewportConfig(),
  });

  final Widget child;

  /// The space configuration for the Fluid UI Design system.
  final SpaceConfig spaceConfig;

  /// The type configuration for the Fluid UI Design system.
  final TypeConfig typeConfig;

  /// The viewport configuration for the Fluid UI Design system.
  /// This is used to determine the min and max viewport sizes.
  final ViewportConfig viewportConfig;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      ScreenSizeHelper.instance.setWidth(MediaQuery.of(context).size);
      if (!FluidConfigState.instance.initialized) {
        FluidConfigState.instance.setConfig(spaceConfig, typeConfig, viewportConfig);
      }

      return child;
    });
  }
}
