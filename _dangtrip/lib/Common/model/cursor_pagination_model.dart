import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagination_model.g.dart';

//⭐️⭐️ Class 로 상태를 구분할때는 항상 base Class 는 abstract 이며,
//extends 하는 이유는 CursorPagintion 이 CursorPaginationBase의 타입인지 알기 위해 ⭐️⭐️
abstract class CursorPaginationBase {}

//데이터가 안들어 왔을때
class CursorPagintionError extends CursorPaginationBase {
  final String message;
  CursorPagintionError({
    required this.message,
  });
}

//로딩시
class CursorPagintionLoading extends CursorPaginationBase {}

//값이 잘 왔을때
@JsonSerializable(
  genericArgumentFactories: true,
)
//입력한 T 값의 fromJson 모델이 들어간다
class CursorPagintion<T> extends CursorPaginationBase {
  //extends 하는 이유는 CursorPagintion 이 CursorPaginationBase의 타입인지 알기 위해
  final CursorPaginationMeta meta;
  final List<T> data;

  CursorPagintion({
    required this.meta,
    required this.data,
  });
  factory CursorPagintion.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CursorPagintionFromJson(json, fromJsonT);
}

@JsonSerializable()
class CursorPaginationMeta {
  final int count;
  final bool hasMore;

  CursorPaginationMeta({
    required this.count,
    required this.hasMore,
  });

  factory CursorPaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$CursorPaginationMetaFromJson(json);
}

//스크롤 아래로 당겼을때 새로고침 기능
//CursorPagintion 을 상속하는 이유는 meta 와 data 가 이미 존재하는 상황이기 때문에
class CursorPagintionRefeching<T> extends CursorPagintion<T> {
  CursorPagintionRefeching({
    required super.data,
    required super.meta,
  });
}

//스크롤 마지막에서 추가 데이터를 요청하는 중일때
class CursorPagintionFechingMore<T> extends CursorPagintion<T> {
  CursorPagintionFechingMore({
    required super.data,
    required super.meta,
  });
}
