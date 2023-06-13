// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_cursor_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceCursorPagination _$PlaceCursorPaginationFromJson(
        Map<String, dynamic> json) =>
    PlaceCursorPagination(
      resultList: (json['resultList'] as List<dynamic>)
          .map((e) => PlaceInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$PlaceCursorPaginationToJson(
        PlaceCursorPagination instance) =>
    <String, dynamic>{
      'resultList': instance.resultList,
      'totalCount': instance.totalCount,
      'message': instance.message,
    };
