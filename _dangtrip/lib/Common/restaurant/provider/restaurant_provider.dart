import 'package:_dangtrip/Common/restaurant/model/restaurant_model.dart';
import 'package:_dangtrip/Common/restaurant/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantProvider =
    StateNotifierProvider<RestaurantStateNotifier, List<RestaurantModel>>(
        (ref) {
  final repository = ref.watch(restaurantRepositoryProvider);
  final notifier = RestaurantStateNotifier(repository: repository);
  return notifier;
});

//캐싱에 관련된 프로바이더는 모두 statenotifier
class RestaurantStateNotifier extends StateNotifier<List<RestaurantModel>> {
  final RestaurantRepository repository;
  RestaurantStateNotifier({
    required this.repository,
  }) : super([]) {
    paginate(); //RestaurantStateNotifier 가 생성이 되는 순간 바로 실행된다.
  }

  paginate() async {
    final res = await repository.paginate();

    state = res.data;
  }
}
