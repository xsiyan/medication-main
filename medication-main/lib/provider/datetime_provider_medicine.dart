import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateMedicineProvider = StateProvider<String>((ref) {
  return 'dd/mm/yy';
});

final timeMedicineProvider = StateProvider<String>((ref) {
  return 'hh : mm';
});
