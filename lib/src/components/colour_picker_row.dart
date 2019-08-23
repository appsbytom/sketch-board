import 'package:flutter/material.dart';
import 'package:sketch_board/src/colours.dart';

class ColourPickerRow extends StatelessWidget {
  const ColourPickerRow({
    Key key,
    this.colours,
    @required this.selectedColour,
    @required this.selectColour,
  }) : super(key: key);

  final List<Color> colours;
  final Color selectedColour;
  final ValueChanged<Color> selectColour;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: (colours ?? defaultColors).map((colour) {
        return Padding(
          padding: const EdgeInsets.only(right: 7.5),
          child: GestureDetector(
            onTap: () => selectColour(colour),
            child: CircleAvatar(
              backgroundColor: colour,
              child: colour == selectedColour
                  ? Icon(Icons.check, color: lightColours.contains(colour) ? Colors.black : Colors.white)
                  : Container(),
            ),
          ),
        );
      }).toList(),
    );
  }
}
