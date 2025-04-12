import 'package:flutter/material.dart';
import 'package:sketchy/features/home/ui/home_screen.dart';

class Sketchy extends StatelessWidget {
  const Sketchy({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sketchy',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
