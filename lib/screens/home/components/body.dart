import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/screens/home/components/cards.dart';
import 'package:todosaif/screens/home/components/taskcard.dart';
import 'package:todosaif/utils/sizedbox.dart';

class Body extends StatefulWidget {
  final String user;
/*   final List<Task> tasks;
  const Body({Key? key, required this.tasks}) : super(key: key); */

  const Body({Key? key, required this.user}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List tasks;

  // ignore: prefer_final_fields, unused_field

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(widget.user)
            .orderBy('createdOn', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          int taskLen = snapshot.data?.docs.length ?? 0;
          int red = 0;
          int yellow = 0;
          int green = 0;
          for (int i = 0; i < taskLen; i++) {
            String taskPrio = snapshot.data!.docs[i]['priority'];
            print("priority: $taskPrio");
            if (taskPrio == 'red') {
              red++;
              print('Red: $red');
            }
            if (taskPrio == 'yellow') {
              yellow++;
              print('yellow: $yellow');
            }
            if (taskPrio == 'green') {
              green++;
              print('green: $green');
            }
          }

          return Column(
            children: [
              //First Part
              verticalBox(30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Text(
                  "What's Up, ${widget.user}!",
                  style: const TextStyle(
                      fontFamily: 'Halenoir',
                      color: colorPrimary,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
              verticalBox(25),

              //Second Part
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      child: const Text('CATEGORIES',
                          style: TextStyle(
                              fontFamily: 'Halenoir',
                              color: colorAccent,
                              fontSize: 17,
                              fontWeight: FontWeight.w500)),
                      alignment: Alignment.topLeft,
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 170,
                      child: ListView(
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          cards(red, "Red"),
                          cards(yellow, "Yellow"),
                          cards(green, "Green"),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              verticalBox(20),

              //Third Part
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: const Text("TODAY'S TASK",
                          style: TextStyle(
                              fontFamily: 'Halenoir',
                              color: colorAccent,
                              fontSize: 17,
                              fontWeight: FontWeight.w500)),
                      alignment: Alignment.topLeft,
                    ),
                    verticalBox(15),
                    Expanded(
                      child: (() {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView(
                          children: snapshot.data!.docs.map((document) {
                            return taskCards(context, document, widget.user);
                          }).toList(),
                        );
                      }()),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
