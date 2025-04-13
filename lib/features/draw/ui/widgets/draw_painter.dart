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
            ..color = stroke.strokeColor
            ..strokeCap = StrokeCap.round
            ..strokeWidth = stroke.brushSize;

      final points = stroke.offsetPoints;

      for (int i = 0; i < points.length - 1; i++) {
        if (points[i] != Offset.zero &&
            points[i + 1] != Offset.zero) {
          canvas.drawLine(
            points[i],
            points[i + 1],
            paint,
          );
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
