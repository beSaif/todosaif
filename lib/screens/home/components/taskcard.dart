// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/utils/sizedbox.dart';

Widget taskCards() {
  return Container(
    padding: const EdgeInsets.only(right: 20),
    height: 80,
    width: 200,
    child: Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.circle_outlined,
              color: Colors.blue,
            ),
            horizontalBox(20),
            const Text(
              'Finish your business plan',
              style: TextStyle(
                  fontFamily: 'Halenoir',
                  color: colorPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    ),
  );
}
