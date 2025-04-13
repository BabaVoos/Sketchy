import 'package:hive_flutter/adapters.dart';
import 'package:sketchy/features/draw/models/offset.dart';
import 'package:sketchy/features/draw/models/stroke.dart';

abstract class DatabaseService {
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register the adapter for the Stroke class
    Hive.registerAdapter(OffsetCustomAdapter());
    Hive.registerAdapter(StrokeAdapter());

    await Hive.openBox<List<Stroke>>('sketches');
  }

  // close the database
  static Future<void> close() async {
    await Hive.close();
  }

  static Box<List<Stroke>> getSketchesBox() {
    return Hive.box<List<Stroke>>('sketches');
  }

  static Future<void> saveSketch(String name, List<Stroke> strokes) async {
    final Box<List<Stroke>> sketchesBox = getSketchesBox();
    await sketchesBox.put(name, strokes);
  }

  static List<List<Stroke>> getAllSketches() {
    final Box<List<Stroke>> sketchesBox = getSketchesBox();
    return sketchesBox.values.toList();
  }

  static Future<void> deleteSketch(String name) async {
    final Box<List<Stroke>> sketchesBox = getSketchesBox();
    await sketchesBox.delete(name);
  }
}
