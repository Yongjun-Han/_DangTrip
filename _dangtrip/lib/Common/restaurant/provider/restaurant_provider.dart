import 'package:_dangtrip/Common/model/cursor_pagination_model.dart';
import 'package:_dangtrip/Common/model/pagination_params.dart';
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

  void paginate({
    //더 요청할 데이터 개수
    int fetchCount = 20,
    //추가로 데이터 가져오기
    //true : 데이터 추가 false : 새로고침
    bool fetchMore = false,
    //강제로 다시 로딩 --> true 일 경우 강제초기 새로고침 : CursorPaginationLoading()
    bool forceRefetch = false,
  }) async {
    // final res = await repository.paginate();

    // state = res;
    //5가지 State 의 상태
    //1.CursorPagination - 정상적으로 데이터를 응답 받았을때
    //2.CursorPaginationLoading - 데이터가 로딩중인 상태 (현재 캐시 없음
    //3.CursorPaginationError - 에러가 있는상태
    //4.CursorPaginationRefetching - 첫번째 페이지부터 다시 데이터를 가져올때
    //5.CursorPaginationFetchMore - 추가 데이터를 요청할때

    //바로 반환하는 상황
    //1.hasMore = false 일때 (더이상 데이터가 없는 상태)
    if (state is CursorPagintion && !forceRefetch) {
      final parsedState = state as CursorPagintion;
      //hasMore 값이 잇다는것은 데이터를 성공적으로 가져왔다는것
      if (!parsedState.meta.hasMore) {
        return;
      }
    }
    //2.로딩중일때
    //- fetchMore = true 일때   (다음데이터 들오기 전에 또 요청하면 같은 데이터를 또 가져온다. 방지하기 위해 바로 리턴)
    //- fetchMore가 아닐때  (새로고침의 의도가 있을때, 기존 요청이 중요하지 않다)
    final isLoading = state is CursorPagintionLoading; //초기 로딩
    final isRefetching =
        state is CursorPagintionRefeching; // 데이터를 받아온적이 있으나 새로고침시
    final isFetchingMore = state is CursorPagintionFetchingMore;

    if (fetchMore && (isLoading && isRefetching && isFetchingMore)) {
      return;
    }

    //Pagination Params 생성
    PaginationParams paginationParams = PaginationParams(
      count: fetchCount,
    );
    // fetchMore 이미 데이터가 있는 상태에서 데이터를 추가로 더 요청하는 상황
    if (fetchMore) {
      final parsedState = state as CursorPagintion;
      //이미 있는 데이터 상태에서 class 를 CursorPagintionFetchingMore 로 변환
      state = CursorPagintionFetchingMore(
        data: parsedState.data,
        meta: parsedState.meta,
      );

      paginationParams = paginationParams.copyWith(
        after: parsedState.data.last.id,
      );
    }
    final res = await repository.paginate(
      paginationParams: paginationParams,
    );

    if (state is CursorPagintionFetchingMore) {
      final parsedState = state as CursorPagintionFetchingMore;
      //기존 데이터에 새로운 데이터 추가
      state = res.copyWith(
        data: [
          ...parsedState.data,
          ...res.data,
        ],
      );
    }
  }
}
