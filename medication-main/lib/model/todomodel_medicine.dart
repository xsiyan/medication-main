import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModelMedicinePressure {
  String? docID;
  final String medicineName;
  final String dosage;
  final String type;
  final String dateTask;
  final String timeTask;
  final bool isDone;
  TodoModelMedicinePressure({
    this.docID,
    required this.medicineName,
    required this.dosage,
    required this.type,
    required this.dateTask,
    required this.timeTask,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docID': docID,
      'medicineName': medicineName,
      'dosage': dosage,
      'type': type,
      'dateTask': dateTask,
      'timeTask': timeTask,
      'isDone': isDone,
    };
  }

  factory TodoModelMedicinePressure.fromMap(Map<String, dynamic> map) {
    return TodoModelMedicinePressure(
      docID: map['docID'] != null ? map['docID'] as String : null,
      medicineName: map['medicineName'] as String,
      dosage: map['dosage'] as String,
      type: map['type'] as String,
      dateTask: map['dateTask'] as String,
      timeTask: map['timeTask'] as String,
      isDone: map['isDone'] as bool,
    );
  }
  factory TodoModelMedicinePressure.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return TodoModelMedicinePressure(
        docID: doc.id,
        medicineName: doc['medicineName'],
        dosage: doc['dosage'],
        type: doc['type'],
        dateTask: doc['dateTask'],
        timeTask: doc['timeTask'],
        isDone: doc['isDone']);
    // );
  }
}
