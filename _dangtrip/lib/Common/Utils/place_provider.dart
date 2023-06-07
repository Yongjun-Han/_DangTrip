import 'package:flutter_riverpod/flutter_riverpod.dart';

//API 요청용 장소 카테코리 코드
final categoryProvider = StateProvider<String>((ref) => "PC01");
// //상세페이지 이미지 인덱싱용
// final sliderIndex = StateProvider<int>((ref) => 0);

final selectedCategoryProvider = StateProvider<bool>((ref) => false);
