import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medication/model/todomodel_bloodsugar.dart';

class TodoBloodSugarService {
  final todoCollection =
      FirebaseFirestore.instance.collection('todoBloodSugar');

  // CREATE
  void addNewTaskBloodSugar(TodoModelBloodSugarPressure model) {
    todoCollection.add(model.toMap());
  }

  void updateBloodSugarTask(String? docID, bool? valueUpdate) {
    todoCollection.doc(docID).update({
      'isDone': valueUpdate,
    });
  }

  void deleteBloodSugarTask(String? docID) {
    todoCollection.doc(docID).delete();
  }
}
