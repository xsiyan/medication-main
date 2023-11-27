import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:medication/Widget/cardtodo_medicine.dart';
import 'package:medication/common/show_model.dart';
import 'package:medication/provider/service_medicine.dart';

class Medicine extends ConsumerWidget {
  const Medicine({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamMedicineProvider);
    DateTime now = DateTime.now();
    String currentDate = DateFormat('EEEE, d MMMM').format(now);
    var $ScreenHeight = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('MEDICINE PAGE'),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.calendar),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.bell),
              ),
            ]),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Todays Task',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        currentDate,
                        style: TextStyle(
                          fontSize: $ScreenHeight * 1.8,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD5E8FA),
                      foregroundColor: Colors.blue.shade800,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      context: context,
                      builder: (context) => AddNewTaskMedicineModel(),
                    ),
                    child: Text(
                      '+ New Task',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Gap(20),
              if (todoData.when(
                data: (data) => data.isNotEmpty,
                loading: () => true,
                error: (error, stackTrace) => false,
              ))
                ListView.builder(
                  itemCount: todoData.value!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      CardTodoMedicineWidget(getIndex: index),
                )
              else if (todoData.error != null)
                Text('Error: ${todoData.error}')
              else
                const Text('No data available'),
            ],
          ),
        ),
      ),
    );
  }
}
