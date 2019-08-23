import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sketch_board/src/sketching/sketching_controller.dart';
import 'package:sketch_board/src/sketching/sketching_painter.dart';

class SketchingCanvas extends StatelessWidget {
  const SketchingCanvas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<SketchingController>(context);
    var expandableController = ExpandableController.of(context);

    return GestureDetector(
      child: ClipRect(
        child: RepaintBoundary(
          key: controller.sketchKey,
          child: CustomPaint(
            painter: SketchingPainter(
              history: controller.history,
              repaint: controller,
            ),
            size: Size.infinite,
          ),
        ),
      ),
      onPanStart: (start) {
        if (expandableController.expanded) expandableController.toggle();
        controller.startSketch(getPoint(context, start.globalPosition));
      },
      onPanUpdate: (update) => controller
          .updateSketchPath(getPoint(context, update.globalPosition)),
      onPanEnd: (end) => controller.endSketch(),
    );
  }

  Offset getPoint(BuildContext context, Offset position) {
    return (context.findRenderObject() as RenderBox).globalToLocal(position);
  }
}
