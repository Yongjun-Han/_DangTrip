import 'package:_dangtrip/Common/model/cursor_pagination_model.dart';
import 'package:_dangtrip/Common/restaurant/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantProvider =
    StateNotifierProvider<RestaurantStateNotifier, CursorPaginationBase>((ref) {
  final repository = ref.watch(restaurantRepositoryProvider);
  final notifier = RestaurantStateNotifier(repository: repository);
  return notifier;
});

//캐싱에 관련된 프로바이더는 모두 statenotifier
class RestaurantStateNotifier extends StateNotifier<CursorPaginationBase> {
  final RestaurantRepository repository;
  RestaurantStateNotifier({
    required this.repository,
  }) : super(CursorPagintionLoading()) {
    paginate(); //RestaurantStateNotifier 가 생성이 되는 순간 바로 실행된다.
  }

  paginate({
    //더 요청할 데이터 개수
    int fetchCount = 20,
    //추가로 데이터 가져오기
    //true : 데이터 추가 false : 새로고침
    bool fetchMore = false,
    //강제로 다시 로딩 --> true 일 경우 강제초기 새로고침 : CursorPaginationLoading()
    bool forceRefetch = false,
  }) async {
    final res = await repository.paginate();

    state = res;
    //5가지 State 의 상태
    //1.CursorPagination - 정상적으로 데이터를 응답 받았을때
    //2.CursorPaginationLoading - 데이터가 로딩중인 상태 (현재 캐시 없음
    //3.CursorPaginationError - 에러가 있는상태
    //4.CursorPaginationRefetching - 첫번째 페이지부터 다시 데이터를 가져올때
    //5.CursorPaginationFetchMore - 추가 데이터를 요청할때
  }
}
