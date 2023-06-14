import 'package:_dangtrip/Common/Dio/dio.dart';
import 'package:_dangtrip/Common/secure/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//API 요청용 장소 카테코리 코드
final categoryProvider = StateProvider<String>((ref) => "PC01");
// //상세페이지 이미지 인덱싱용
// final sliderIndex = StateProvider<int>((ref) => 0);

//여행탭 선택한 카테고리
final selectedCategoryProvider = StateProvider<bool>((ref) => false);

//pagination을 위한 쿼리 파라미터
final contentPageProvider = StateProvider<int>((ref) => 1);

final placeDataProvider = StateProvider<List>((ref) => []);

//dio provider
final dioRequestProvider = Provider<Dio>((ref) {
  final dio = Dio();
  final storage = ref.watch(secureStorageProvider);

  dio.interceptors.add(
    CustomInterceptor(storage: storage),
  );
  return dio;
});
