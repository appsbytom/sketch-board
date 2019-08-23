import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sketch_board/src/components/expandable_controls.dart';
import 'package:sketch_board/src/components/sketching_canvas.dart';

class SketchBoardPage extends StatelessWidget {
  const SketchBoardPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: const Scaffold(
        body: SafeArea(
          child: SketchingCanvas(),
        ),
        bottomNavigationBar: ExpandableControls(),
      ),
    );
  }
}