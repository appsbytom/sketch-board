import 'package:flutter/material.dart';
import 'package:sketch_board/src/sketching/path_history.dart';

class SketchingPainter extends CustomPainter {
  final PathHistory history;

  const SketchingPainter({
    this.history,
    Listenable repaint,
  }) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) => history.draw(canvas, size);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
