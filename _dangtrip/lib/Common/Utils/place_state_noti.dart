import 'package:_dangtrip/Common/Utils/place_provider.dart';
import 'package:_dangtrip/Common/repository/place_repository.dart';
import 'package:_dangtrip/model/place_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final PlaceProvider =
    StateNotifierProvider<PlaceStateNotifier, List<PlaceInfoModel>>(
  (ref) {
    final repository = ref.watch(placeRepositoryProvider);
    final notifier = PlaceStateNotifier(
        repository: repository,
        page: ref.watch(contentPageProvider),
        pcCode: ref.watch(categoryProvider));
    return notifier;
  },
);

class PlaceStateNotifier extends StateNotifier<List<PlaceInfoModel>> {
  final int page;
  final String pcCode;
  final PlaceRepository repository;
  PlaceStateNotifier({
    required this.repository,
    required this.page,
    required this.pcCode,
  }) : super([]) {
    paginate();
  }

  paginate() async {
    final res =
        await repository.paginate(page: page, pcCode: pcCode, pageBlock: 10);

    state = res[0].resultList;
  }
}
