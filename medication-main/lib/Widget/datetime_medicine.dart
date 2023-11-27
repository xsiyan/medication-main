import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:medication/constants/appstyle_medicine.dart';

class DateTimeMedicineWidget extends ConsumerWidget {
  const DateTimeMedicineWidget({
    super.key,
    required this.titleText,
    required this.valueText,
    required this.iconSection,
    required this.onTap,
  });

  final String titleText;
  final String valueText;
  final IconData iconSection;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleText, style: AppstyleMedicine.headingTwo),
          Gap(12),
          Material(
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => onTap(),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(iconSection),
                      Gap(12),
                      Text(valueText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
