import '../space/space_config.dart';
import '../type/type_config.dart';
import 'viewport_config.dart';

class FluidConfigState {
  FluidConfigState._();
  late SpaceConfig spaceConfig;
  late TypeConfig typeConfig;
  late ViewportConfig viewportConfig;
  bool initialized = false;

  /// Sets the configuration for the Fluid UI Design system.
  void setConfig(SpaceConfig spaceConfig, TypeConfig typeConfig, ViewportConfig viewportConfig) {
    this.spaceConfig = spaceConfig;
    this.typeConfig = typeConfig;
    this.viewportConfig = viewportConfig;
    initialized = true;
  }

  static final FluidConfigState _instance = FluidConfigState._();

  static FluidConfigState get instance => _instance;
}
