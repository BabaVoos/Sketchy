import 'package:flutter/material.dart';
import 'package:sketchy/core/services/database_service.dart';
import 'package:sketchy/sketchy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.init();
  runApp(const Sketchy());
}
