import 'package:flutter/material.dart';

extension WidgetListExtension on List<Widget> {
  List<Widget> withSeperator(Widget seperator) =>
      map((e) => (e, seperator)).fold([], (a, b) => [...a, b.$1, b.$2])..removeLast();
}
