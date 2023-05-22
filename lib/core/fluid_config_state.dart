import 'package:fluid_ui_design/core/viewport_config.dart';
import 'package:fluid_ui_design/space/space_config.dart';
import 'package:fluid_ui_design/type/type_config.dart';

class FluidConfigState {
  FluidConfigState._();
  late SpaceConfig spaceConfig;
  late TypeConfig typeConfig;
  late ViewportConfig viewportConfig;
  bool initialized = false;

  void setConfig(SpaceConfig spaceConfig, TypeConfig typeConfig, ViewportConfig viewportConfig) {
    this.spaceConfig = spaceConfig;
    this.typeConfig = typeConfig;
    this.viewportConfig = viewportConfig;
    initialized = true;
  }

  static final FluidConfigState _instance = FluidConfigState._();

  static FluidConfigState get instance => _instance;
}
