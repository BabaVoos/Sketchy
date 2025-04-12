import 'package:flutter/material.dart';
import 'package:sketchy/features/draw/models/stroke.dart';
import 'package:sketchy/features/draw/ui/widgets/color_picker.dart';
import 'package:sketchy/features/draw/ui/widgets/draw_painter.dart';
import 'package:sketchy/features/draw/ui/widgets/draw_tool_bar.dart';

class DrawScreen extends StatefulWidget {
  const DrawScreen({super.key});

  @override
  State<DrawScreen> createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  // Keeps all finished strokes (the lines you've drawn and lifted your finger from).
  final List<Stroke> _strokes = <Stroke>[];

  // Tracks the current stroke as the user is still drawing (finger is down).
  final List<Offset> _currentPoints = <Offset>[];

  final List<Stroke> _redoStrokes = <Stroke>[];
  Color _selectedColor = Colors.black;
  double _selectedBrushSize = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onPanStart: (DragStartDetails details) {
                setState(() {
                  _currentPoints.add(details.localPosition);
                });
              },
              onPanUpdate:
                  (DragUpdateDetails details) => setState(() {
                    _currentPoints.add(details.localPosition);
                  }),
              onPanEnd: (DragEndDetails details) {
                setState(() {
                  _strokes.add(
                    Stroke(
                      points: List.from(_currentPoints),
                      color: _selectedColor,
                      brushSize: _selectedBrushSize,
                    ),
                  );
                  _currentPoints.clear();
                  _redoStrokes.clear();
                });
              },
              child: CustomPaint(
                painter: DrawPainter(
                  strokes: _strokes,
                  currentPoints: _currentPoints,
                  color: _selectedColor,
                  brushSize: _selectedBrushSize,
                ),
                size: Size.infinite,
              ),
            ),
          ),
          DrawToolBar(
            selectedColor: _selectedColor,
            brushSize: _selectedBrushSize,
            onColorPickerPressed:
                () => openColorPicker(
                  context,
                  selectedColor: _selectedColor,
                  onColorSelected: (color) {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                ),
            onBrushSizeChanged: (double? value) {
              setState(() {
                _selectedBrushSize = value!;
              });
            },
            onRedo:
                _redoStrokes.isEmpty
                    ? null
                    : () {
                      setState(() {
                        if (_redoStrokes.isNotEmpty) {
                          _strokes.add(_redoStrokes.removeLast());
                        }
                      });
                    },
            onUndo:
                _strokes.isEmpty
                    ? null
                    : () {
                      setState(() {
                        if (_strokes.isNotEmpty) {
                          _redoStrokes.add(_strokes.removeLast());
                        }
                      });
                    },
          ),
        ],
      ),
    );
  }
}
