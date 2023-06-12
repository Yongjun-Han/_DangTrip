// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailPageModel _$DetailPageModelFromJson(Map<String, dynamic> json) =>
    DetailPageModel(
      resultList:
          PlaceDetailModel.fromJson(json['resultList'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DetailPageModelToJson(DetailPageModel instance) =>
    <String, dynamic>{
      'resultList': instance.resultList,
      'message': instance.message,
    };
