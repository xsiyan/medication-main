import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medication/Widget/cardtodo_bloodsugar.dart';
import 'package:medication/Widget/cardtodo_medicine.dart';
import 'package:medication/common/show_Bsugar_model.dart';
import 'package:medication/common/show_model.dart';
import 'package:medication/provider/service_bloodsugar.dart';

class BloodSugar extends ConsumerWidget {
  const BloodSugar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamBloodSugarProvider);
    DateTime now = DateTime.now();
    String currentDate = DateFormat('EEEE, d MMMM').format(now);
    var $ScreenHeight = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      backgroundColor: Color(0xFFEFE6CD),
      appBar: AppBar(
        backgroundColor: Color(0xFF7D8758),
        foregroundColor: Colors.black,
        title: Text(
          'BLOOD SUGAR SECTION',
          style: GoogleFonts.firaSans(fontWeight: FontWeight.bold),
        ),
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
                      builder: (context) => Container(
                        child: AddNewTaskBloodSugarModel(),
                      ),
                    ),
                    child: Text(
                      '+ New Task',
                      style: GoogleFonts.firaSans(),
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
                      CardTodoBloodSugarWidget(getIndex: index),
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
