import 'package:_dangtrip/model/place_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'place_cursor_pagination_model.g.dart';

@JsonSerializable()
class PlaceCursorPagination {
  final List<PlaceInfoModel> resultList;
  final int totalCount;
  final String message;
  PlaceCursorPagination({
    required this.resultList,
    required this.totalCount,
    required this.message,
  });

  factory PlaceCursorPagination.fromJson(Map<String, dynamic> json) =>
      _$PlaceCursorPaginationFromJson(json);
}
