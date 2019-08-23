import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sketch_board/src/controls.dart';
import 'package:sketch_board/src/pages/sketch_board_page.dart';
import 'package:sketch_board/src/sketching/sketching_controller.dart';

class SketchBoard extends StatelessWidget {
  const SketchBoard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SketchingController>.value(
          value: SketchingController(),
        ),
        ChangeNotifierProvider<ControlsNotifier>.value(
          value: ControlsNotifier(Controls.sketch),
        ),
      ],
      child: MaterialApp(
        title: 'Sketch Board',
        home: const SketchBoardPage(),
        theme: ThemeData.dark(),
      ),
    );
  }
}