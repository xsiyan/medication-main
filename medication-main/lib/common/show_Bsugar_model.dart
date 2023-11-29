import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:medication/Widget/datetime_bloodsugar.dart';
import 'package:medication/Widget/datetime_medicine.dart';
import 'package:medication/Widget/radiowidget_bloodsugar.dart';
import 'package:medication/Widget/radiowidget_medicine.dart';
import 'package:medication/Widget/textfield_bloodsugar.dart';
import 'package:medication/Widget/textfield_medicine.dart';
import 'package:medication/constants/appstyle_bloodsugar.dart';
import 'package:medication/constants/appstyle_medicine.dart';
import 'package:medication/model/todomodel_bloodsugar.dart';

import 'package:medication/model/todomodel_medicine.dart';
import 'package:medication/provider/date_time_provider.dart';

import 'package:medication/provider/datetime_provider_medicine.dart';
import 'package:medication/provider/radioprovider_bloodsugar.dart';
import 'package:medication/provider/radioprovider_medicine.dart';
import 'package:medication/provider/service_bloodsugar.dart';

import 'package:medication/provider/service_medicine.dart';

import '../provider/datetime_provider_loodsugar.dart';

final TextEditingController sugarController = TextEditingController();
final TextEditingController descriptionController = TextEditingController();

class AddNewTaskBloodSugarModel extends ConsumerWidget {
  AddNewTaskBloodSugarModel({
    super.key,
  });

  // final diastolicController = TextEditingController();
  // final systolicController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateBloodSugarProvider);
    return Container(
      padding: const EdgeInsets.all(30),
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
            'Sugar Concentration',
            style: AppstyleBloodSugar.headingThree,
          ),
          Gap(6),
          TextFormField(
            maxLines: 1,
            controller: sugarController,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'mmol/oL',
            ),
          ),
          Gap(20),
          Text(
            'Description',
            style: AppstyleBloodSugar.headingThree,
          ),
          Gap(6),
          TextFormField(
            maxLines: 1,
            controller: descriptionController,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'add description',
            ),
          ),
          Gap(20),
          Text('Mood', style: AppstyleMedicine.headingTwo),
          Row(
            children: [
              Expanded(
                child: RadioWidgetMedicine(
                  categColor: Colors.green,
                  titleRadio: 'anxious',
                  valueInput: 1,
                  onChangeValue: () => ref
                      .read(medicineRadioProvider.notifier)
                      .update((state) => 1),
                ),
              ),
              Expanded(
                child: RadioWidgetMedicine(
                  categColor: Colors.blue.shade700,
                  titleRadio: 'happy',
                  valueInput: 2,
                  onChangeValue: () => ref
                      .read(medicineRadioProvider.notifier)
                      .update((state) => 2),
                ),
              ),
              Expanded(
                child: RadioWidgetMedicine(
                  categColor: Colors.amberAccent,
                  titleRadio: 'sad',
                  valueInput: 3,
                  onChangeValue: () => ref
                      .read(medicineRadioProvider.notifier)
                      .update((state) => 3),
                ),
              ),
            ],
          ),
          // DATE AND TIME
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeBloodSugarWidget(
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
                        .read(dateBloodSugarProvider.notifier)
                        .update((state) => format.format(getValue));
                  }
                },
              ),
              Gap(22),
              DateTimeBloodSugarWidget(
                titleText: 'Time',
                valueText: ref.watch(timeBloodSugarProvider),
                iconSection: CupertinoIcons.clock,
                onTap: () async {
                  final getTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (getTime != null) {
                    ref
                        .read(timeBloodSugarProvider.notifier)
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
                    final getRadioValue = ref.read(medicineRadioProvider);
                    String mood = '';

                    switch (getRadioValue) {
                      case 1:
                        mood = 'ANXIOUS';
                        break;
                      case 2:
                        mood = 'HAPPY';
                        break;
                      case 3:
                        mood = 'SAD';
                        break;
                    }

                    ref.read(serviceBloodSugarProvider).addNewTaskBloodSugar(
                        TodoModelBloodSugarPressure(
                            sugarConcentration: sugarController.text,
                            description: descriptionController.text,
                            mood: mood,
                            dateTask: dateProv,
                            timeTask: ref.read(timeBloodSugarProvider),
                            isDone: false));

                    print('Data is saving');

                    sugarController.clear();
                    descriptionController.clear();
                    ref
                        .read(bloodSugarRadioProvider.notifier)
                        .update((state) => 0);
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
