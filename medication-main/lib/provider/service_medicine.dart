import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication/model/todomodel_medicine.dart';
import 'package:medication/services/todoservice_medicine.dart';

final serviceMedicineProvider = StateProvider<TodoMedicineService>((ref) {
  return TodoMedicineService();
});

final fetchStreamMedicineProvider =
    StreamProvider<List<TodoModelMedicinePressure>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('todoMedicine')
      .snapshots()
      .map((event) => event.docs
          .map((snapshot) => TodoModelMedicinePressure.fromSnapshot(snapshot))
          .toList());
  yield* getData;
});
