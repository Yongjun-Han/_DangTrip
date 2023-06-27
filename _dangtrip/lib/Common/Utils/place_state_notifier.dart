import 'package:_dangtrip/Common/Utils/place_provider.dart';
import 'package:_dangtrip/Common/repository/place_repository.dart';
import 'package:_dangtrip/model/place_cursor_pagination_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final placeProvider =
    StateNotifierProvider<PlaceStateNotifier, PlaceCursorPaginationBase>(
  (ref) {
    final repository = ref.watch(placeRepositoryProvider);
    final notifier = PlaceStateNotifier(
      repository: repository,
      // page: 1,
      page: ref.watch(contentPageProvider),
      pcCode: ref.watch(categoryProvider),
    );
    return notifier;
  },
);

class PlaceStateNotifier extends StateNotifier<PlaceCursorPaginationBase> {
  late final int page;
  final String pcCode;
  final PlaceRepository repository;
  PlaceStateNotifier({
    required this.repository,
    required this.page,
    required this.pcCode,
  }) : super(PlaceCursorPaginationLoading()) {
    paginate();
  }

  void paginate({
    //true 일 경우 추가데이터 요청
    //false 일 경우 새로고침 (현재 상태를 대치)
    bool fetchMore = false,
    //강제 재로딩
    //true = PlaceCursorPaginationLoading
    bool forceRefech = false,
  }) async {
    try {
      //바로 반환해야할때 :
      //1.contentPageProvider 가 totalCount-10 보다 클때. 데이터가 더 없음
      if (state is PlaceCursorPagination && !forceRefech) {
        final pState = state as PlaceCursorPagination;
        if (pState.totalCount - 10 < 1) {
          return;
        }
      }
      //2.fetchMore 가 true 일때
      final isLoading = state is PlaceCursorPaginationLoading;
      final isRefetching = state is PlaceCursorPaginationRefetching;
      final isFetchingMore = state is PlaceCursorPaginationFetchingMore;

      if (fetchMore && (isLoading || isRefetching || isFetchingMore)) {
        return;
      }

      //5가지 state 의 가능성
      //1.정상적으로 데이터가 있는상태 - PlaceCursorPagination;
      //2.데이터가 로딩중인 상태(캐시없음) - PlaceCursorPaginationLoading;
      //3.에러가 있는 상태 - PlaceCursorPaginationError;
      //4.처음부터 다시 가져올때 - PlaceCursorPaginationRefetching;
      //5.추가 데이터를 paginate 해오는 요청을 받을때 - PlaceCursorPaginationFetchingMore;

      //fetchMore 상황 : 데이터를 가지고 있고 추가로 데이터를 요청 할때
      if (fetchMore) {
        final pState = state as PlaceCursorPagination;
        state = PlaceCursorPaginationFetchingMore(
          message: pState.message,
          totalCount: pState.totalCount,
          resultList: pState.resultList,
        );
        // PlaceStateNotifier(
        //     repository: repository, page: page + 10, pcCode: pcCode);
      }
      //데이터를 처음부터 가져오는 상황
      else {
        //만약 데이터가 있는 상황이라면 기존데이터를 보존한채로 fetch
        if (state is PlaceCursorPagination && !forceRefech) {
          final pState = state as PlaceCursorPagination;
          state = PlaceCursorPaginationRefetching(
            message: pState.message,
            totalCount: pState.totalCount,
            resultList: pState.resultList,
          );
        } else {
          state = PlaceCursorPaginationLoading();
        }
      }

      final res =
          await repository.paginate(pageBlock: 10, page: page, pcCode: pcCode);

      if (state is PlaceCursorPaginationFetchingMore) {
        final pState = state as PlaceCursorPaginationFetchingMore;
        state = res[0].copyWith(resultList: [
          ...pState.resultList,
          ...res[0].resultList,
        ]);
      } else {
        state = res[0];
      }
    } catch (e) {
      state = PlaceCursorPaginationError(message: "데이터를 가져오지 못했습니다.");
    }
  }
}
