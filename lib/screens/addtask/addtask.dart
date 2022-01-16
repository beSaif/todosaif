import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/screens/addtask/components/bottomFAB.dart';
import 'package:todosaif/screens/addtask/components/closebutton.dart';
import 'package:todosaif/screens/addtask/components/taskfield.dart';
import 'package:todosaif/utils/sizedbox.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
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
              closeButton(context),
              verticalBox(10),

              //Middle Input Section
              taskField(),
              //Enter new task
              verticalBox(10),
              //Bottom Right Button
              bottomFAB(context),
            ],
          ),
        ),
      ),
    );
  }
}
