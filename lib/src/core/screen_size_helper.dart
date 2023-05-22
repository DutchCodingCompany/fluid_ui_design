import 'package:flutter/material.dart';

class ScreenSizeHelper {
  ScreenSizeHelper._();
  //Default value, this is overwritten by the setWidth.
  double _screenWidth = 320; 

  void setWidth(Size mediaQuerySize) => _screenWidth = mediaQuerySize.width;
  double get screenWidth => _screenWidth; 

  static final ScreenSizeHelper _instance = ScreenSizeHelper._();

  static ScreenSizeHelper get instance => _instance;
}

double get screenWidth => ScreenSizeHelper.instance.screenWidth;
