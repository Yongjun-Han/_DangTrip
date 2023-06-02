import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = StateProvider<String>((ref) => "PC01");

final selectedCategoryProvider = StateProvider<bool>((ref) => false);
