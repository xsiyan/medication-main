import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:medication/provider/service_bloodsugar.dart';
import 'package:medication/provider/service_medicine.dart';

class CardTodoBloodSugarWidget extends ConsumerWidget {
  const CardTodoBloodSugarWidget({
    Key? key,
    required this.getIndex,
  }) : super(key: key);

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamBloodSugarProvider);
    return todoData.when(
      data: (todoData) {
        Color categoryColor = Colors.white;
        final getCategory = todoData[getIndex].mood;
        switch (getCategory.toLowerCase()) {
          case 'anxious':
            categoryColor = Colors.green;
            break;
          case 'happy':
            categoryColor = Colors.blue.shade700;
            break;
          case 'sad':
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
                              .read(serviceBloodSugarProvider)
                              .deleteBloodSugarTask(todoData[getIndex].docID),
                        ),
                        title: Text(
                          todoData[getIndex].sugarConcentration,
                          style: TextStyle(
                              decoration: todoData[getIndex].isDone
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        subtitle: Text(
                          todoData[getIndex].description,
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
                                  .read(serviceBloodSugarProvider)
                                  .updateBloodSugarTask(
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
                                  Text(todoData[getIndex].dateTask),
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
