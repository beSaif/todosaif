// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/utils/sizedbox.dart';

class AddTask extends StatefulWidget {
  final String user;
  const AddTask({Key? key, required this.user}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final taskName = TextEditingController();
  var hintColor = colorAccent;
  var hintText = 'Enter new task';
  double hintSize = 30;
  var name;
  var timing = 'any';
  var priority = 'green';
  int dayIcon = 0;
  int priorityIcon = 1;

  addData(String name, String priority, String timing) {
    Map<String, dynamic> demoData = {
      "name": name,
      "priority": priority,
      "timing": timing,
      "status": true,
      "createdOn": FieldValue.serverTimestamp()
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(widget.user);
    collectionReference.add(demoData);

    print("Task added to firestore successfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButton: ,
      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Top Right Close Button
              Container(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  heroTag: 'topRightCloseButton',
                  onPressed: () {
                    // Add your onPressed code here!
                    Navigator.pop(context);
                  },
                  backgroundColor: colorBackground,
                  elevation: 0,
                  foregroundColor: colorPrimary,
                  shape: const StadiumBorder(
                      side: BorderSide(color: colorAccent, width: 2.5)),
                  child: const Icon(Icons.close),
                ),
              ),
              verticalBox(10),

              //Middle Input Section
              Column(
                children: [
                  TextFormField(
                    controller: taskName,
                    onChanged: (value) =>
                        {print('Task: ${taskName.text}'), name = value},
                    style: const TextStyle(
                        fontFamily: 'Halenoir',
                        color: colorPrimary,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: TextStyle(
                            fontFamily: 'Halenoir',
                            color: hintColor,
                            fontSize: hintSize,
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
                              dayIcon = 0;
                            } else {
                              dayIcon++;
                            }

                            if (dayIcon == 0) {
                              timing = 'any';
                              print("timing: $timing");
                            }
                            if (dayIcon == 1) {
                              timing = 'morning';
                              print("timing: $timing");
                            }
                            if (dayIcon == 2) {
                              timing = 'evening';
                              print('timing: $timing');
                            }
                            if (dayIcon == 3) {
                              timing = 'night';
                              print('timing: $timing');
                            }
                          });
                          // Respond to button press
                        },
                        icon: Icon(
                          (() {
                            // your code here
                            if (dayIcon == 0) {
                              return Icons.timelapse_rounded;
                            }
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
                          if (dayIcon == 0) {
                            return 'Any';
                          }
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

                              if (priorityIcon == 1) {
                                priority = 'green';
                                print('priority: $priority');
                              }
                              if (priorityIcon == 2) {
                                priority = 'yellow';
                                print('priority: $priority');
                              }
                              if (priorityIcon == 3) {
                                priority = 'red';
                                print('priority: $priority');
                              }
                            },
                            backgroundColor: colorBackground,
                            elevation: 0,
                            foregroundColor: colorPrimary,
                            shape: const StadiumBorder(
                                side:
                                    BorderSide(color: colorAccent, width: 2.5)),
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
              ),
              verticalBox(10),

              Container(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                  heroTag: 'bottomRightCloseButton2',
                  backgroundColor: colorPrimary,
                  onPressed: () {
                    if (name == null) {
                      print('Forgot to fill the name');
                      setState(() {
                        hintText = 'you forgot to fill me :(';
                        hintColor = Colors.red.shade300;
                        hintSize = 18;
                      });
                    } else {
                      addData(name, priority, timing);
                      print(
                          "name: $name, priority: $priority, timing: $timing");
                      Navigator.of(context).pop();
                    }

                    // Respond to button press
                  },
                  label: const Text('Add Task'),
                  icon: const Icon(Icons.check),
                ),
              ),
              //Bottom Right Button
            ],
          ),
        ),
      ),
    );
  }
}
