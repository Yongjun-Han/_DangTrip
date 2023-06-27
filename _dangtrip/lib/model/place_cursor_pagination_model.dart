import 'package:_dangtrip/model/place_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'place_cursor_pagination_model.g.dart';

abstract class PlaceCursorPaginationBase {}

// 에러 발생
class PlaceCursorPaginationError extends PlaceCursorPaginationBase {
  final String message;

  PlaceCursorPaginationError({
    required this.message,
  });
}

//데이터 로딩
class PlaceCursorPaginationLoading extends PlaceCursorPaginationBase {}

//extends 하는 이유는 PlaceCursorPagination이 PlaceCursorPaginationBase 의 타입인지 알기 위해
@JsonSerializable()
class PlaceCursorPagination extends PlaceCursorPaginationBase {
  final List<PlaceInfoModel> resultList;
  final int totalCount;
  final String message;
  PlaceCursorPagination({
    required this.resultList,
    required this.totalCount,
    required this.message,
  });

  PlaceCursorPagination copyWith({
    List<PlaceInfoModel>? resultList,
    int? totalCount,
    String? message,
  }) {
    return PlaceCursorPagination(
      resultList: resultList ?? this.resultList,
      totalCount: totalCount ?? this.totalCount,
      message: message ?? this.message,
    );
  }

  factory PlaceCursorPagination.fromJson(Map<String, dynamic> json) =>
      _$PlaceCursorPaginationFromJson(json);
}

//이미 데이터가 있는 상태에서
//새로고침 할때
class PlaceCursorPaginationRefetching extends PlaceCursorPagination {
  PlaceCursorPaginationRefetching({
    required super.message,
    required super.totalCount,
    required super.resultList,
  });
}

//스크롤 맨 아래에서
//추가 데이터를 요청하는중
class PlaceCursorPaginationFetchingMore extends PlaceCursorPagination {
  PlaceCursorPaginationFetchingMore({
    required super.message,
    required super.totalCount,
    required super.resultList,
  });
}
