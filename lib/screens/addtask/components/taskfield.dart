// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/utils/sizedbox.dart';

class taskField extends StatefulWidget {
  const taskField({Key? key}) : super(key: key);

  @override
  _taskFieldState createState() => _taskFieldState();
}

class _taskFieldState extends State<taskField> {
  int dayIcon = 1;
  int priorityIcon = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: const TextStyle(
              fontFamily: 'Halenoir',
              color: colorPrimary,
              fontSize: 30,
              fontWeight: FontWeight.w700),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter new task',
              hintStyle: TextStyle(
                  fontFamily: 'Halenoir',
                  color: colorAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.w700)),
        ),

        verticalBox(20),

        //Options
        Row(
          children: [
            FloatingActionButton.extended(
              heroTag: 'timeSetterButton',
              backgroundColor: colorBackground,
              elevation: 0,
              foregroundColor: colorPrimary,
              shape: const StadiumBorder(
                  side: BorderSide(color: colorAccent, width: 2.5)),
              onPressed: () {
                setState(() {
                  if (dayIcon == 3) {
                    dayIcon = 1;
                  } else {
                    dayIcon++;
                  }
                });
                // Respond to button press
              },
              icon: Icon(
                (() {
                  // your code here
                  if (dayIcon == 1) {
                    return Icons.wb_sunny_outlined;
                  }
                  if (dayIcon == 2) {
                    return Icons.cloud_circle_outlined;
                  }
                  if (dayIcon == 3) {
                    return Icons.mode_night_outlined;
                  }
                }()),
              ),
              label: Text((() {
                // your code here
                if (dayIcon == 1) {
                  return 'Morning';
                }
                if (dayIcon == 2) {
                  return 'Evening';
                }
                return 'Night';
              }())),
            ),
            horizontalBox(10),
            SizedBox(
              height: 50,
              width: 50,
              child: FittedBox(
                child: FloatingActionButton(
                  heroTag: 'prioritySetterButton',
                  onPressed: () {
                    // Add your onPressed code here!
                    setState(() {
                      if (priorityIcon == 3) {
                        priorityIcon = 1;
                      } else {
                        priorityIcon++;
                      }
                    });
                  },
                  backgroundColor: colorBackground,
                  elevation: 0,
                  foregroundColor: colorPrimary,
                  shape: const StadiumBorder(
                      side: BorderSide(color: colorAccent, width: 2.5)),
                  child: Icon(
                    Icons.circle,
                    color: (() {
                      // your code here
                      if (priorityIcon == 1) {
                        return Colors.green;
                      }
                      if (priorityIcon == 2) {
                        return Colors.yellow.shade700;
                      }
                      return Colors.red;
                    }()),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
