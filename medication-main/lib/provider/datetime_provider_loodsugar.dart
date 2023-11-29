import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateBloodSugarProvider = StateProvider<String>((ref) {
  return 'dd/mm/yy';
});

final timeBloodSugarProvider = StateProvider<String>((ref) {
  return 'hh : mm';
});
