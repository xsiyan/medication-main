import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:medication/Widget/datetime_bloodpressure.dart';
import 'package:medication/Widget/radiowidget_bloodpressure.dart';
import 'package:medication/Widget/textfield_bloodpressure.dart';
import 'package:medication/constants/appstyle_bloodpressure.dart';
import 'package:medication/main.dart';
import 'package:medication/model/todomodel_bloodpressure.dart';
import 'package:medication/provider/datetime_provider_bloodpressure.dart';
import 'package:medication/provider/datetime_provider_loodsugar.dart';
import 'package:medication/provider/radioprovider_bloodpressure.dart';
import 'package:medication/provider/service_bloodpressure.dart';

final diastolicController = TextEditingController();
final systolicController = TextEditingController();

class AddNewTaskBloodPressureModel extends ConsumerWidget {
  AddNewTaskBloodPressureModel({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateBPProvider);
    return Container(
      padding: EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Blood Pressure List',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade200,
          ),
          Gap(20),
          Text(
            'Systolic Pressure',
            style: AppstyleBloodPressure.headingOne,
          ),
          Gap(6),
          TextFormField(
            maxLines: 1,
            controller: systolicController,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: 'add systolic pressure',
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
          ),
          Gap(20),
          Text(
            'Diastolic Pressure',
            style: AppstyleBloodPressure.headingOne,
          ),
          Gap(6),
          TextFormField(
            maxLines: 1,
            controller: diastolicController,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: 'add diastolic pressure',
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
          ),
          Gap(20),
          Text('What you feel', style: AppstyleBloodPressure.headingOne),
          Row(
            children: [
              Expanded(
                child: RadioWidgetBloodPressure(
                  categColor: Colors.green,
                  titleRadio: 'anxious',
                  valueInput: 1,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 1),
                ),
              ),
              Expanded(
                child: RadioWidgetBloodPressure(
                  categColor: Colors.blue.shade700,
                  titleRadio: 'happy',
                  valueInput: 2,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 2),
                ),
              ),
              Expanded(
                child: RadioWidgetBloodPressure(
                  categColor: Colors.amberAccent,
                  titleRadio: 'sad',
                  valueInput: 3,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 3),
                ),
              ),
            ],
          ),
          // DATE AND TIME
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeBloodPressureWidget(
                titleText: 'Date',
                valueText: dateProv,
                iconSection: CupertinoIcons.calendar,
                onTap: () async {
                  final getValue = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2025));
                  if (getValue != null) {
                    final format = DateFormat.yMd();
                    ref
                        .read(dateBPProvider.notifier)
                        .update((state) => format.format(getValue));
                  }
                },
              ),
              Gap(22),
              DateTimeBloodPressureWidget(
                titleText: 'Time',
                valueText: ref.watch(timeBPProvider),
                iconSection: CupertinoIcons.clock,
                onTap: () async {
                  final getTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (getTime != null) {
                    ref
                        .read(timeBPProvider.notifier)
                        .update((state) => getTime.format(context));
                  }
                },
              ),
            ],
          ),
          // BUTTON SECTION
          Gap(12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade800,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.blue.shade800),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
              ),
              Gap(30),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    // final getTime = await showTimePicker(
                    //   context: context,
                    //   initialTime: TimeOfDay.now(),
                    // );
                    // if (getTime != null) {
                    //   ref
                    //       .read(timeBPProvider.notifier)
                    //       .update((state) => getTime.format(context));

                    //   // Schedule the notification
                    //   scheduleNotification(getTime);
                    // }
                    final getRadioValue = ref.read(radioProvider);
                    String gender = '';

                    switch (getRadioValue) {
                      case 1:
                        gender = 'ANXIOUS';
                        break;
                      case 2:
                        gender = 'HAPPY';
                        break;
                      case 3:
                        gender = 'SAD';
                        break;
                    }

                    // Update the controllers with the latest input values
                    ref
                        .read(serviceBloodPressureProvider)
                        .addNewTaskBloodPressure(TodoModelBloodPressure(
                          diastolicTask: diastolicController.text,
                          systolicTask: systolicController.text,
                          gender: gender,
                          dateTask: dateProv,
                          timeTask: ref.read(timeBPProvider),
                          isDone: false,
                        ));

                    diastolicController.clear();
                    systolicController.clear();
                    print('Data is saving');
                    ref.read(radioProvider.notifier).update((state) => 0);
                    Navigator.pop(context);
                  },
                  child: const Text('Create'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
