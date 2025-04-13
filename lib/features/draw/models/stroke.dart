import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:sketchy/features/draw/models/offset.dart';
part 'stroke.g.dart';

@HiveType(typeId: 1)
class Stroke {
  factory Stroke.fromOffsetList({
    required List<Offset> points,
    required Color color,
    required double brushSize,
  }) {
    return Stroke(
      points: points.map((point) => OffsetCustom.fromOffset(point)).toList(),
      color: color.value,
      brushSize: brushSize,
    );
  }
  Stroke({required this.points, required this.color, required this.brushSize});

  @HiveField(0)
  final List<OffsetCustom> points;

  @HiveField(1)
  final int color;

  @HiveField(2)
  final double brushSize;

  List<Offset> get offsetPoints {
    return points.map((point) => point.toOffset()).toList();
  }

  Color get strokeColor => Color(color);
}
