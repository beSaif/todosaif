// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';

Widget bottomFAB(context) {
  return Container(
    alignment: Alignment.bottomRight,
    child: FloatingActionButton.extended(
      heroTag: 'bottomRightCloseButton',
      backgroundColor: colorPrimary,
      onPressed: () {
        Navigator.of(context).pop();
        // Respond to button press
      },
      label: const Text('Submit'),
      icon: const Icon(Icons.check),
    ),
  );
}
