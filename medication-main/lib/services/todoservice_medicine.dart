import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medication/model/todomodel_medicine.dart';

class TodoMedicineService {
  final todoCollection = FirebaseFirestore.instance.collection('todoMedicine');

  // CREATE
  void addNewTaskMedicine(TodoModelMedicinePressure model) {
    todoCollection.add(model.toMap());
  }

  void updateMedicineTask(String? docID, bool? valueUpdate) {
    todoCollection.doc(docID).update({
      'isDone': valueUpdate,
    });
  }

  void deleteMedicineTask(String? docID) {
    todoCollection.doc(docID).delete();
  }
}
