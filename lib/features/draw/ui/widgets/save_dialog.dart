import 'package:flutter/material.dart';
import 'package:sketchy/core/services/database_service.dart';
import 'package:sketchy/features/draw/models/stroke.dart';

void showSaveSketchDialog({
  required BuildContext context,
  required List<Stroke> strokes,
}) {
  final TextEditingController nameController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext newContext) {
      return AlertDialog(
        title: const Text('Save Sketch'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(hintText: 'Enter sketch name'),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(newContext).pop();
            },
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              final String sketchName = nameController.text.trim();
              if (sketchName.isEmpty) return;
              DatabaseService.saveSketch(sketchName, strokes);
              Navigator.of(newContext).pop();
            },
          ),
        ],
      );
    },
  ).then((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Sketch saved successfully!',
          style: TextStyle(color: Colors.white, fontSize: 22),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.deepPurple,
      ),
    );
  });
}
