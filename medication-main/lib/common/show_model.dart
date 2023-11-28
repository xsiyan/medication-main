import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:medication/Widget/datetime_medicine.dart';
import 'package:medication/Widget/radiowidget_medicine.dart';
import 'package:medication/Widget/textfield_bloodpressure.dart';
import 'package:medication/Widget/textfield_medicine.dart';
import 'package:medication/constants/appstyle_medicine.dart';

import 'package:medication/model/todomodel_medicine.dart';
import 'package:medication/provider/date_time_provider.dart';

import 'package:medication/provider/datetime_provider_medicine.dart';
import 'package:medication/provider/radioprovider_medicine.dart';

import 'package:medication/provider/service_medicine.dart';

class AddNewTaskMedicineModel extends ConsumerWidget {
  AddNewTaskMedicineModel({
    super.key,
  });

  // final diastolicController = TextEditingController();
  // final systolicController = TextEditingController();
  final TextEditingController medicineController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateMedicineProvider);
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
            'Medicine Name',
            style: AppstyleMedicine.headingTwo,
          ),
          Gap(6),
          TextFieldMedicine(
            maxLines: 1,
            hintText: 'add medicine name',
            txtController: medicineController,
          ),
          Gap(20),
          Text(
            'Dosage',
            style: AppstyleMedicine.headingTwo,
          ),
          Gap(6),
          TextFieldMedicine(
            maxLines: 1,
            hintText: 'add dosage in mg',
            txtController: dosageController,
          ),
          Gap(20),
          Text('Type', style: AppstyleMedicine.headingTwo),
          Row(
            children: [
              Expanded(
                child: RadioWidgetMedicine(
                  categColor: Colors.green,
                  titleRadio: 'pill',
                  valueInput: 1,
                  onChangeValue: () => ref
                      .read(medicineRadioProvider.notifier)
                      .update((state) => 1),
                ),
              ),
              Expanded(
                child: RadioWidgetMedicine(
                  categColor: Colors.blue.shade700,
                  titleRadio: 'syringe',
                  valueInput: 2,
                  onChangeValue: () => ref
                      .read(medicineRadioProvider.notifier)
                      .update((state) => 2),
                ),
              ),
              Expanded(
                child: RadioWidgetMedicine(
                  categColor: Colors.amberAccent,
                  titleRadio: 'bottle',
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
              DateTimeMedicineWidget(
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
                        .read(dateMedicineProvider.notifier)
                        .update((state) => format.format(getValue));
                  }
                },
              ),
              Gap(22),
              DateTimeMedicineWidget(
                titleText: 'Time',
                valueText: ref.watch(timeMedicineProvider),
                iconSection: CupertinoIcons.clock,
                onTap: () async {
                  final getTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (getTime != null) {
                    ref
                        .read(timeMedicineProvider.notifier)
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
                    String type = '';

                    switch (getRadioValue) {
                      case 1:
                        type = 'PILL';
                        break;
                      case 2:
                        type = 'SYRINGE';
                        break;
                      case 3:
                        type = 'BOTTLE';
                        break;
                    }
                    ref
                        .read(serviceMedicineProvider)
                        .addNewTaskMedicine(TodoModelMedicinePressure(
                          medicineName: medicineController.text,
                          dosage: dosageController.text,
                          type: type,
                          dateTask: ref.read(dateProvider),
                          timeTask: ref.read(timeProvider),
                          isDone: false,
                        ));

                    print('Data is saving');

                    medicineController.clear();
                    dosageController.clear();
                    ref
                        .read(medicineRadioProvider.notifier)
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
