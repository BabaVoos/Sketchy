import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
part 'offset.g.dart';

@HiveType(typeId: 0)
class OffsetCustom extends HiveObject {
  factory OffsetCustom.fromOffset(Offset offset) {
    return OffsetCustom(offset.dx, offset.dy);
  }

  OffsetCustom(this.dx, this.dy);

  @HiveField(0)
  final double dx;

  @HiveField(1)
  final double dy;

  Offset toOffset() {
    return Offset(dx, dy);
  }
}
