import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication/model/todomodel_bloodsugar.dart';

import 'package:medication/services/todoservice_bloodpressure.dart';
import 'package:medication/services/todoservice_bloodsugar.dart';

final serviceBloodSugarProvider = StateProvider<TodoBloodSugarService>((ref) {
  return TodoBloodSugarService();
});

final fetchStreamBloodSugarProvider =
    StreamProvider<List<TodoModelBloodSugarPressure>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('todoBloodSugar')
      .snapshots()
      .map((event) => event.docs
          .map((snapshot) => TodoModelBloodSugarPressure.fromSnapshot(snapshot))
          .toList());
  yield* getData;
});
