// import 'package:_dangtrip/Common/Utils/place_provider.dart';
// import 'package:_dangtrip/Common/repository/place_repository.dart';
// import 'package:_dangtrip/model/place_cursor_pagination_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final placeprovider = StateNotifierProvider<PlaceStateNotifierProvider,
//     List<PlaceCursorPagination>>((ref) {
//   final repository = ref.watch(placeRepositoryProvider);
//   final page = ref.watch(contentPageProvider);
//   final pcCode = ref.watch(categoryProvider);
//   final notifier = PlaceStateNotifierProvider(
//       repository: repository, page: page, pcCode: pcCode);
//   return notifier;
// });

// class PlaceStateNotifierProvider
//     extends StateNotifier<List<PlaceCursorPagination>> {
//   final int page;
//   final String pcCode;
//   final PlaceRepository repository;
//   PlaceStateNotifierProvider({
//     required this.repository,
//     required this.page,
//     required this.pcCode,
//   }) : super([]) {
//     paginate(page, pcCode);
//   }

//   paginate(int page, String pcCode) async {
//     final res = await repository.paginate(page: page, pcCode: pcCode);
//     state = res;
//     print("[노티파이어프로바이더]${state[0].resultList[0].address}");
//   }
// }
