import 'package:flutter/material.dart';

class DrawToolBar extends StatelessWidget {
  const DrawToolBar({
    super.key,
    required this.onUndo,
    required this.onRedo,
    required this.brushSize,
    required this.onBrushSizeChanged,
    required this.selectedColor,
    required this.onColorPickerPressed,
  });
  final VoidCallback? onUndo;
  final VoidCallback? onRedo;
  final double brushSize;
  final ValueChanged<double?> onBrushSizeChanged;
  final Color selectedColor;
  final VoidCallback onColorPickerPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: const Icon(Icons.undo), onPressed: onUndo),
          IconButton(icon: const Icon(Icons.redo), onPressed: onRedo),
          DropdownButton<double>(
            dropdownColor: Colors.grey.shade100,
            alignment: AlignmentDirectional.center,
            underline: const SizedBox(),
            value: brushSize,
            items: const [
              DropdownMenuItem(value: 2.0, child: Text('Small')),
              DropdownMenuItem(value: 4.0, child: Text('Medium')),
              DropdownMenuItem(value: 6.0, child: Text('Large')),
            ],
            onChanged: onBrushSizeChanged,
          ),
          IconButton(
            icon: Icon(Icons.color_lens, color: selectedColor),
            onPressed: onColorPickerPressed,
          ),
        ],
      ),
    );
  }
}
