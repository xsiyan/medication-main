import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medication/model/todomodel_bloodpressure.dart';

class TodoBloodPressureService {
  final todoCollection =
      FirebaseFirestore.instance.collection('todoBloodPressure');

  // CREATE
  void addNewTaskBloodPressure(TodoModelBloodPressure model) {
    todoCollection.add(model.toMap());
  }

  void updateBloodPressureTask(String? docID, bool? valueUpdate) {
    todoCollection.doc(docID).update({
      'isDone': valueUpdate,
    });
  }

  void deleteBloodPressureTask(String? docID) {
    todoCollection.doc(docID).delete();
  }
}
