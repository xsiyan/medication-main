import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication/model/todomodel_bloodpressure.dart';
import 'package:medication/services/todoservice_bloodpressure.dart';

final serviceBloodPressureProvider =
    StateProvider<TodoBloodPressureService>((ref) {
  return TodoBloodPressureService();
});

final fetchStreamBPProvider =
    StreamProvider<List<TodoModelBloodPressure>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('todoBloodPressure')
      .snapshots()
      .map((event) => event.docs
          .map((snapshot) => TodoModelBloodPressure.fromSnapshot(snapshot))
          .toList());
  yield* getData;
});
