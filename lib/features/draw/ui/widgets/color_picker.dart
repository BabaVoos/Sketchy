import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void openColorPicker(
  BuildContext context, {
  Color? selectedColor,
  required Function(Color) onColorSelected,
}) {
  Color tempColor = selectedColor ?? Colors.black;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Select a color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            paletteType: PaletteType.hsv,
            pickerColor: tempColor,
            onColorChanged: (Color color) {
              tempColor = color;
            },
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
            onPressed: () {
              onColorSelected(tempColor);
              Navigator.of(context).pop();
            },
            child: const Text(
              'Select',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
        ],
      );
    },
  );
}
