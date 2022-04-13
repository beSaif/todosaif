import 'package:cloud_firestore/cloud_firestore.dart';

void welcome(user) async {
  Map<String, dynamic> welcome = {
    "name": 'Hey there!',
    "priority": 'green',
    "timing": 'any',
    "status": true,
    "createdOn": FieldValue.serverTimestamp()
  };
  Map<String, dynamic> plusButton = {
    "name": "Press the '+' button to create a task.",
    "priority": 'yellow',
    "timing": 'any',
    "status": true,
    "createdOn": FieldValue.serverTimestamp()
  };
  Map<String, dynamic> time = {
    "name": 'Icon on the right indicates the time it should be completed by.',
    "priority": 'red',
    "timing": 'night',
    "status": true,
    "createdOn": FieldValue.serverTimestamp()
  };
  Map<String, dynamic> color = {
    "name": 'Use colors to signify the importance of the task.',
    "priority": 'green',
    "timing": 'any',
    "status": true,
    "createdOn": FieldValue.serverTimestamp()
  };
  Map<String, dynamic> bye = {
    "name": 'Thank You. - @be.saif ',
    "priority": 'yellow',
    "timing": 'any',
    "status": true,
    "createdOn": FieldValue.serverTimestamp()
  };
  List data = [bye, color, time, plusButton, welcome];
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(user);
  for (int i = 0; i < data.length; i++) {
    await collectionReference.doc().set(data[i]);
  }
}
