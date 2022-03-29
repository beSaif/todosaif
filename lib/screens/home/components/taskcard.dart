// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/utils/sizedbox.dart';

Widget taskCards(String name, String priority) {
  late Color color;
  if (priority == 'red') {
    color = Colors.red;
  }
  if (priority == 'green') {
    color = Colors.green;
  }
  if (priority == 'yellow') {
    color = Colors.yellow.shade700;
  }

  return Container(
    padding: const EdgeInsets.only(right: 20),
    width: 200,
    child: Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.circle_outlined,
              color: color,
            ),
            horizontalBox(20),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                    fontFamily: 'Halenoir',
                    color: colorPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
