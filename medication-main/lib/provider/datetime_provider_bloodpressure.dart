import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateBPProvider = StateProvider<String>((ref) {
  return 'dd/mm/yy';
});

final timeBPProvider = StateProvider<String>((ref) {
  return 'hh : mm';
});
