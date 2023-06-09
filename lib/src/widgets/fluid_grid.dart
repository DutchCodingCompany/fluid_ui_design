import 'dart:math' as math;

import 'package:flutter/material.dart';

class FluidGrid extends StatelessWidget {
  const FluidGrid({
    super.key,
    required this.children,
    required this.width,
    required this.minimalChildWidth,
    this.maxChildrenPerRow,
    this.bottomSpacing,
    this.itemSpacing,
    this.keepItemsSameSize = false,
  });

  final List<Widget> children;
  final double width;
  final double minimalChildWidth;
  final int? maxChildrenPerRow;
  final double? bottomSpacing;
  final double? itemSpacing;
  final bool keepItemsSameSize;

  List<List<Widget>> _partitionWidgets(List<Widget> widgets, int childrenPerRow) {
    var chunks = <List<Widget>>[];
    int chunkSize = 2;
    for (var i = 0; i < widgets.length; i += chunkSize) {
      chunks.add(widgets.sublist(i, i + chunkSize > widgets.length ? widgets.length : i + chunkSize));
    }
    return chunks;
  }

  List<Widget> childrenWithSpacers(List<Widget> row, int childrenPerRow, bool isLastRow) {
    final List<Widget> childrenWithSpacers = [];
    for (var child in row) {
      childrenWithSpacers.add(
        Expanded(child: child),
      );
      if (child != row.last) {
        childrenWithSpacers.add(SizedBox(width: itemSpacing));
      }
    }
    if (keepItemsSameSize && isLastRow) {
      int remainder = childrenPerRow - row.length;
      childrenWithSpacers.addAll(
        List.generate(
          remainder,
          (index) => Expanded(
            child: Container(),
          ),
        ),
      );
      childrenWithSpacers.addAll(
        List.generate(remainder, (index) => SizedBox(width: itemSpacing)),
      );
    }
    return childrenWithSpacers;
  }

  @override
  Widget build(BuildContext context) {
    final childrenPerRow =
        math.max(math.min((width / minimalChildWidth).floor(), maxChildrenPerRow ?? children.length), 1);

    return Column(
      children: _partitionWidgets(children, childrenPerRow)
          .map(
            (row) => Padding(
              padding: EdgeInsets.only(bottom: bottomSpacing ?? 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: childrenWithSpacers(row, childrenPerRow, children.last == row.last),
              ),
            ),
          )
          .toList(),
    );
  }
}
