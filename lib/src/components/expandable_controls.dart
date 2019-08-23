import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sketch_board/src/components/sketch_controls.dart';
import 'package:sketch_board/src/components/control_bar.dart';
import 'package:sketch_board/src/components/canvas_controls.dart';
import 'package:sketch_board/src/controls.dart';

class ExpandableControls extends StatelessWidget {
  const ExpandableControls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Consumer<ControlsNotifier>(
          builder: (context, controls, child) {
            return Expandable(
                expanded: controls.value == Controls.sketch
                    ? const SketchControls()
                    : const CanvasControls(),
            );
          },
        ),
        FractionallySizedBox(
          widthFactor: 1,
          child: const ControlBar(),
        ),
      ],
    );
  }
}