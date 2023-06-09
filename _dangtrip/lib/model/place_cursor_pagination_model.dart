// import 'package:_dangtrip/model/place_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'place_cursor_pagination_model.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
)
class PlaceCursorPagination<T> {
  final PlaceCursorPaginationTotalCount totalCount;
  final List<T> resultList;

  PlaceCursorPagination({
    required this.resultList,
    required this.totalCount,
  });

  factory PlaceCursorPagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PlaceCursorPaginationFromJson(json, fromJsonT);
}

@JsonSerializable()
class PlaceCursorPaginationTotalCount {
  final int totalCount;
  PlaceCursorPaginationTotalCount({
    required this.totalCount,
  });

  factory PlaceCursorPaginationTotalCount.fromJson(Map<String, dynamic> json) =>
      _$PlaceCursorPaginationTotalCountFromJson(json);
}
