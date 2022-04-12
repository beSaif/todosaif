// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/utils/sizedbox.dart';

Widget cards(int total, String priorityTime) {
  Color progressColor = Colors.blue;
  double value = 1 - (total / 10);

  if (total == 0) {
    return const Text("");
  }
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
                Text(
                  "$total tasks",
                  style: const TextStyle(
                      fontFamily: 'Halenoir',
                      color: colorAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  priorityTime,
                  style: const TextStyle(
                      fontFamily: 'Halenoir',
                      color: colorPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                verticalBox(10),
                LinearProgressIndicator(
                  value: value,
                  backgroundColor: colorAccent,
                  color: progressColor,
                ),
                verticalBox(2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        (() {
                          if (value == 1) {
                            return "completed";
                          }
                          return "";
                        }()),
                        style: const TextStyle(
                            fontFamily: 'Halenoir',
                            color: colorAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
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
