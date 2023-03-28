import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

const List<Color> colors = [
  Colors.red,
  Color.fromARGB(225, 232, 104, 32),
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
  Colors.black,
];

class BlockColorPickerExample extends StatefulWidget {
  const BlockColorPickerExample({
    Key? key,
    required this.pickerColor,
    required this.onColorChanged,
    required this.pickerColors,
    required this.onColorsChanged,
    required this.colorHistory,
  }) : super(key: key);

  final Color pickerColor;
  final ValueChanged<Color> onColorChanged;
  final List<Color> pickerColors;
  final ValueChanged<List<Color>> onColorsChanged;
  final List<Color> colorHistory;

  @override
  State<BlockColorPickerExample> createState() =>
      _BlockColorPickerExampleState();
}

class _BlockColorPickerExampleState extends State<BlockColorPickerExample> {
  final int _portraitCrossAxisCount = 4;
  final int _landscapeCrossAxisCount = 5;
  final double _borderRadius = 10;
  final double _blurRadius = 5;
  final double _iconSize = 10;

  Widget pickerLayoutBuilder(
      BuildContext context, List<Color> colors, PickerItem child) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return SizedBox(
      width: 200,
      height: orientation == Orientation.portrait ? 360 : 240,
      child: GridView.count(
        crossAxisCount: orientation == Orientation.portrait
            ? _portraitCrossAxisCount
            : _landscapeCrossAxisCount,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: [for (Color color in colors) child(color)],
      ),
    );
  }

  Widget pickerItemBuilder(
      Color color, bool isCurrentColor, void Function() changeColor) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: color,
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.8),
              offset: const Offset(1, 2),
              blurRadius: _blurRadius)
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: changeColor,
          borderRadius: BorderRadius.circular(_borderRadius),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: isCurrentColor ? 1 : 0,
            child: Icon(
              Icons.done,
              size: _iconSize,
              color: useWhiteForeground(color) ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Column(
          children: [
            const Text(
              "Settings",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Themes",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Select Colors'),
                        content: SingleChildScrollView(
                          child: BlockPicker(
                            pickerColor: widget.pickerColor,
                            onColorChanged: widget.onColorChanged,
                            availableColors: widget.colorHistory.isNotEmpty
                                ? widget.colorHistory
                                : colors,
                            layoutBuilder: pickerLayoutBuilder,
                            itemBuilder: pickerItemBuilder,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    const Icon(Icons.theaters),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Select Theme',
                      style: TextStyle(
                          color: useWhiteForeground(widget.pickerColor)
                              ? Colors.white
                              : Colors.black),
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
