import 'package:flutter/material.dart';
import 'package:sketchy/features/draw/models/stroke.dart';

class DrawPainter extends CustomPainter {
  DrawPainter({
    required this.strokes,
    required this.currentPoints,
    required this.color,
    required this.brushSize,
  });

  final List<Stroke> strokes;
  final List<Offset> currentPoints;
  final Color color;
  final double brushSize;

  @override
  void paint(Canvas canvas, Size size) {
    // Draw completed strokes
    for (final Stroke stroke in strokes) {
      final Paint paint =
          Paint()
            ..color = stroke.color
            ..strokeCap = StrokeCap.round
            ..strokeWidth = stroke.brushSize;

      for (int i = 0; i < stroke.points.length - 1; i++) {
        if (stroke.points[i] != Offset.zero &&
            stroke.points[i + 1] != Offset.zero) {
          canvas.drawLine(stroke.points[i], stroke.points[i + 1], paint);
        }
      }
    }

    // Draw current stroke
    if (currentPoints.isNotEmpty) {
      final Paint paint =
          Paint()
            ..color = color
            ..strokeCap = StrokeCap.round
            ..strokeWidth = brushSize;

      for (int i = 0; i < currentPoints.length - 1; i++) { 
        if (currentPoints[i] != Offset.zero &&
            currentPoints[i + 1] != Offset.zero) {
          canvas.drawLine(currentPoints[i], currentPoints[i + 1], paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
