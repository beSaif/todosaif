import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';

Widget closeButton(context) {
  return Container(
    alignment: Alignment.topRight,
    child: FloatingActionButton(
      onPressed: () {
        // Add your onPressed code here!
        Navigator.pop(context);
      },
      backgroundColor: colorBackground,
      elevation: 0,
      foregroundColor: colorPrimary,
      shape:
          const StadiumBorder(side: BorderSide(color: colorAccent, width: 2.5)),
      child: const Icon(Icons.close),
    ),
  );
}
