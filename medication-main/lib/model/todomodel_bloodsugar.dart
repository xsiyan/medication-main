import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModelBloodSugarPressure {
  String? docID;
  final String sugarConcentration;
  final String description;
  final String mood;
  final String dateTask;
  final String timeTask;
  final bool isDone;
  TodoModelBloodSugarPressure({
    this.docID,
    required this.sugarConcentration,
    required this.description,
    required this.mood,
    required this.dateTask,
    required this.timeTask,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docID': docID,
      'sugarConcentration': sugarConcentration,
      'description': description,
      'mood': mood,
      'dateTask': dateTask,
      'timeTask': timeTask,
      'isDone': isDone,
    };
  }

  factory TodoModelBloodSugarPressure.fromMap(Map<String, dynamic> map) {
    return TodoModelBloodSugarPressure(
      docID: map['docID'] != null ? map['docID'] as String : null,
      sugarConcentration: map['sugarConcentration'] as String,
      description: map['description'] as String,
      mood: map['mood'] as String,
      dateTask: map['dateTask'] as String,
      timeTask: map['timeTask'] as String,
      isDone: map['isDone'] as bool,
    );
  }
  factory TodoModelBloodSugarPressure.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return TodoModelBloodSugarPressure(
        docID: doc.id,
        sugarConcentration: doc['sugarConcentration'],
        description: doc['description'],
        mood: doc['mood'],
        dateTask: doc['dateTask'],
        timeTask: doc['timeTask'],
        isDone: doc['isDone']);
    // );
  }
}
