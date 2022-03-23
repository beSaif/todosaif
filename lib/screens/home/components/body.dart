import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/screens/home/components/cards.dart';
import 'package:todosaif/screens/home/components/taskcard.dart';
import 'package:todosaif/utils/sizedbox.dart';

class Body extends StatefulWidget {
/*   final List<Task> tasks;
  const Body({Key? key, required this.tasks}) : super(key: key); */

  const Body({
    Key? key,
  }) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List? tasks;

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('tasks');

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    tasks = allData;
    print(tasks);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: Column(
        children: [
          FloatingActionButton(onPressed: () {
            print('Button Pressed');
            getData();
          }),
          //First Part
          verticalBox(30),
          const SizedBox(
            width: double.infinity,
            height: 50,
            child: Text(
              "What's Up, Saif!",
              style: TextStyle(
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
                      cards(),
                      cards(),
                      cards(),
                      cards(),
                      cards(),
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
                // ignore: sized_box_for_whitespace
/*                 Expanded(
                  child: ListView.builder(
                      itemCount: widget.tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (widget.tasks.isEmpty) {
                          return const Text("data");
                        } else {
                          return taskCards();
                        }
                      }),
                ) */
                Expanded(
                  child: ListView.builder(
                      itemCount: tasks?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return taskCards("tasks[index]['name']", Colors.red);
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
