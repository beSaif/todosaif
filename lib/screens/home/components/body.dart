import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/screens/home/components/cards.dart';
import 'package:todosaif/screens/home/components/taskcard.dart';
import 'package:todosaif/utils/sizedbox.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: Column(
        children: [
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
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return taskCards();
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return verticalBox(0);
                      },
                      itemCount: 6),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
