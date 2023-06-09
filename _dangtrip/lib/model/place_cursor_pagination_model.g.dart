// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_cursor_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceCursorPagination<T> _$PlaceCursorPaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PlaceCursorPagination<T>(
      resultList: (json['resultList'] as List<dynamic>).map(fromJsonT).toList(),
      totalCount: PlaceCursorPaginationTotalCount.fromJson(
          json['totalCount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceCursorPaginationToJson<T>(
  PlaceCursorPagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'resultList': instance.resultList.map(toJsonT).toList(),
    };

PlaceCursorPaginationTotalCount _$PlaceCursorPaginationTotalCountFromJson(
        Map<String, dynamic> json) =>
    PlaceCursorPaginationTotalCount(
      totalCount: json['totalCount'] as int,
    );

Map<String, dynamic> _$PlaceCursorPaginationTotalCountToJson(
        PlaceCursorPaginationTotalCount instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };
