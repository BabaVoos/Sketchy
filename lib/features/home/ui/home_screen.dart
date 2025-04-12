import 'package:flutter/material.dart';
import 'package:sketchy/features/draw/ui/draw_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Sketches',
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the drawing screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const DrawScreen(),
              ),
            );
          },
          child: const Text('Start Drawing'),
        ),
      ),
    );
  }
}
