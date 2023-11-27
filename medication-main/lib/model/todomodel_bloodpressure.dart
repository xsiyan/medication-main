import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModelBloodPressure {
  String? docID;
  final String diastolicTask;
  final String systolicTask;
  final String gender;
  final String dateTask;
  final String timeTask;
  final bool isDone;
  TodoModelBloodPressure({
    this.docID,
    required this.diastolicTask,
    required this.systolicTask,
    required this.gender,
    required this.dateTask,
    required this.timeTask,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docID': docID,
      'diastolicTask': diastolicTask,
      'systolicTask': systolicTask,
      'gender': gender,
      'dateTask': dateTask,
      'timeTask': timeTask,
      'isDone': isDone,
    };
  }

  factory TodoModelBloodPressure.fromMap(Map<String, dynamic> map) {
    return TodoModelBloodPressure(
      docID: map['docID'] != null ? map['docID'] as String : null,
      diastolicTask: map['diastolicTask'] as String,
      systolicTask: map['systolicTask'] as String,
      gender: map['gender'] as String,
      dateTask: map['dateTask'] as String,
      timeTask: map['timeTask'] as String,
      isDone: map['isDone'] as bool,
    );
  }
  factory TodoModelBloodPressure.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return TodoModelBloodPressure(
        docID: doc.id,
        diastolicTask: doc['diastolicTask'],
        systolicTask: doc['systolicTask'],
        gender: doc['gender'],
        dateTask: doc['dateTask'],
        timeTask: doc['timeTask'],
        isDone: doc['isDone']);
    // );
  }
}
