// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/utils/sizedbox.dart';

Widget taskCards(BuildContext context, doc, user) {
  String name = doc["name"];
  String timing = doc["timing"];
  String priority = doc["priority"];
  String docID = doc.id;
  Map<String, dynamic> docUndo = {
    "name": doc["name"],
    "priority": doc["priority"],
    "timing": doc["timing"],
    "status": doc["status"],
    "createdOn": doc["createdOn"]
  };
  late Color color;
  if (priority == 'red') {
    color = Colors.red;
  }
  if (priority == 'green') {
    color = Colors.green;
  }
  if (priority == 'yellow') {
    color = Colors.yellow.shade700;
  }

  return Container(
    padding: const EdgeInsets.only(right: 20),
    width: 200,
    child: Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: Icon(
                Icons.circle_outlined,
                color: color,
              ),
              onTap: () {
                final snackBar = SnackBar(
                  duration: const Duration(seconds: 3),
                  backgroundColor: colorPrimary,
                  content: const Text('Ooops :('),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      print('pressed undo');
                      FirebaseFirestore.instance.collection(user).add(docUndo);
                      print("Undo done");
                    },
                  ),
                );

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                print('Deleting $docID');
                FirebaseFirestore.instance.collection(user).doc(docID).delete();
              },
            ),
            horizontalBox(20),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                    fontFamily: 'Halenoir',
                    color: colorPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            GestureDetector(
                onTap: () {
                  print(timing);
                },
                child: Icon(
                  (() {
                    if (timing == 'any') {
                      return null;
                    }
                    if (timing == 'morning') {
                      return Icons.wb_sunny_outlined;
                    }
                    if (timing == 'evening') {
                      return Icons.cloud_circle_outlined;
                    }
                    if (timing == 'night') {
                      return Icons.mode_night_outlined;
                    }
                  }()),
                  color: colorAccent,
                ))
          ],
        ),
      ),
    ),
  );
}
