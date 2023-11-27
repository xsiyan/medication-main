import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:medication/Widget/datetime_bloodpressure.dart';
import 'package:medication/Widget/radiowidget_bloodpressure.dart';
import 'package:medication/Widget/textfield_bloodpressure.dart';
import 'package:medication/constants/appstyle_bloodpressure.dart';
import 'package:medication/model/todomodel_bloodpressure.dart';
import 'package:medication/provider/date_time_provider.dart';
import 'package:medication/provider/datetime_provider_bloodpressure.dart';
import 'package:medication/provider/radioprovider_bloodpressure.dart';
import 'package:medication/provider/service_bloodpressure.dart';

class AddNewTaskBloodPressureModel extends ConsumerWidget {
  AddNewTaskBloodPressureModel({
    super.key,
  });

  // final diastolicController = TextEditingController();
  // final systolicController = TextEditingController();
  final TextEditingController diastolicController = TextEditingController();
  final TextEditingController systolicController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateBPProvider);
    return Container(
      padding: EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.70,
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
              'New Task Todo',
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
            'Diastolic Pressure',
            style: AppstyleBloodPressure.headingOne,
          ),
          Gap(6),
          TextFieldBloodPressure(
            maxLines: 1,
            hintText: 'add diastolic pressure',
            txtController: diastolicController,
          ),
          Gap(20),
          Text(
            'Systolic',
            style: AppstyleBloodPressure.headingOne,
          ),
          Gap(6),
          TextFieldBloodPressure(
            maxLines: 1,
            hintText: 'add systolic pressure',
            txtController: systolicController,
          ),
          Gap(20),
          Text('Feeling', style: AppstyleBloodPressure.headingOne),
          Row(
            children: [
              Expanded(
                child: RadioWidgetBloodPressure(
                  categColor: Colors.green,
                  titleRadio: 'male',
                  valueInput: 1,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 1),
                ),
              ),
              Expanded(
                child: RadioWidgetBloodPressure(
                  categColor: Colors.blue.shade700,
                  titleRadio: 'female',
                  valueInput: 2,
                  onChangeValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 2),
                ),
              ),
              Expanded(
                child: RadioWidgetBloodPressure(
                  categColor: Colors.amberAccent,
                  titleRadio: 'et al.',
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
                    final getRadioValue = ref.read(radioProvider);
                    String gender = '';

                    switch (getRadioValue) {
                      case 1:
                        gender = 'MALE';
                        break;
                      case 2:
                        gender = 'FEMALE';
                        break;
                      case 3:
                        gender = 'OTHERS';
                        break;
                    }
                    ref
                        .read(serviceBloodPressureProvider)
                        .addNewTaskBloodPressure(TodoModelBloodPressure(
                          diastolicTask: diastolicController.text,
                          systolicTask: systolicController.text,
                          gender: gender,
                          dateTask: ref.read(dateProvider),
                          timeTask: ref.read(timeProvider),
                          isDone: false,
                        ));

                    print('Data is saving');

                    diastolicController.clear();
                    systolicController.clear();
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
