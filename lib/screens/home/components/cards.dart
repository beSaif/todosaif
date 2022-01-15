// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/utils/sizedbox.dart';

Widget cards() {
  return SizedBox(
    height: 160,
    width: 200,
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          verticalBox(40),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "40 tasks",
                  style: TextStyle(
                      fontFamily: 'Halenoir',
                      color: colorAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const Text(
                  "Business",
                  style: TextStyle(
                      fontFamily: 'Halenoir',
                      color: colorPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                verticalBox(10),
                const LinearProgressIndicator(
                  value: 0.4,
                  backgroundColor: colorAccent,
                )
              ],
            ),
          )
        ],
      ),
      shadowColor: colorPrimary,
      margin: const EdgeInsets.all(20),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: colorBackground, width: 0)),
    ),
  );
}
