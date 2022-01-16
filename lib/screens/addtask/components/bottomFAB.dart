import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';

Widget bottomFAB(context) {
  return Container(
    alignment: Alignment.bottomRight,
    child: FloatingActionButton.extended(
      backgroundColor: colorPrimary,
      onPressed: () {
        // Respond to button press
      },
      label: const Text('New Task'),
      icon: const Icon(Icons.arrow_drop_up_sharp),
    ),
  );
}
