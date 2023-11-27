import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:medication/provider/service_medicine.dart';

class CardTodoMedicineWidget extends ConsumerWidget {
  const CardTodoMedicineWidget({
    Key? key,
    required this.getIndex,
  }) : super(key: key);

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamMedicineProvider);
    return todoData.when(
      data: (todoData) {
        Color categoryColor = Colors.white;
        final getCategory = todoData[getIndex].type;
        switch (getCategory) {
          case 'Pill':
            categoryColor = Colors.green;
            break;
          case 'Syringe':
            categoryColor = Colors.blue.shade700;
            break;
          case 'Bottle':
            categoryColor = Colors.amber.shade700;
            break;
        }
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: categoryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                width: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: IconButton(
                          icon: Icon(CupertinoIcons.delete),
                          onPressed: () => ref
                              .read(serviceMedicineProvider)
                              .deleteMedicineTask(todoData[getIndex].docID),
                        ),
                        title: Text(
                          todoData[getIndex].medicineName,
                          style: TextStyle(
                              decoration: todoData[getIndex].isDone
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        subtitle: Text(
                          todoData[getIndex].dosage,
                          style: TextStyle(
                              decoration: todoData[getIndex].isDone
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        trailing: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            activeColor: Colors.blue.shade800,
                            shape: CircleBorder(),
                            value: todoData[getIndex].isDone,
                            onChanged: (value) {
                              ref
                                  .read(serviceMedicineProvider)
                                  .updateMedicineTask(
                                      todoData[getIndex].docID, value);
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, -12),
                        child: Container(
                          child: Column(
                            children: [
                              Divider(
                                thickness: 1.5,
                                color: Colors.grey.shade200,
                              ),
                              Row(
                                children: [
                                  Text('Today '),
                                  Gap(12),
                                  Text(todoData[getIndex].timeTask)
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stacktrace) => Center(
        child: Text(stacktrace.toString()),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
