import 'package:flutter/widgets.dart';

class Stroke {
  Stroke({required this.points, required this.color, required this.brushSize});
  final List<Offset> points;
  final Color color;
  final double brushSize;
}
