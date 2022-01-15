import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/utils/sizedbox.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

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

              //Middle Input Section
              Column(
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
                        backgroundColor: colorBackground,
                        elevation: 0,
                        foregroundColor: colorPrimary,
                        shape: const StadiumBorder(
                            side: BorderSide(color: colorAccent, width: 2.5)),
                        onPressed: () {
                          // Respond to button press
                        },
                        icon: const Icon(Icons.wb_sunny_outlined),
                        label: const Text('Morning'),
                      ),
                      horizontalBox(10),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: FittedBox(
                          child: FloatingActionButton(
                            onPressed: () {
                              // Add your onPressed code here!
                            },
                            backgroundColor: colorBackground,
                            elevation: 0,
                            foregroundColor: colorPrimary,
                            shape: const StadiumBorder(
                                side:
                                    BorderSide(color: colorAccent, width: 2.5)),
                            child: const Icon(
                              Icons.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              //Enter new task

              //Bottom Right Button
              Container(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                  backgroundColor: colorPrimary,
                  onPressed: () {
                    // Respond to button press
                  },
                  label: const Text('New Task'),
                  icon: const Icon(Icons.arrow_drop_up_sharp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
