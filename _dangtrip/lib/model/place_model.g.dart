// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceInfoModel _$PlaceInfoModelFromJson(Map<String, dynamic> json) =>
    PlaceInfoModel(
      contentSeq: json['contentSeq'] as int,
      areaName: json['areaName'] as String,
      partName: json['partName'] as String,
      title: json['title'] as String,
      address: json['address'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      tel: json['tel'] as String,
    );

Map<String, dynamic> _$PlaceInfoModelToJson(PlaceInfoModel instance) =>
    <String, dynamic>{
      'areaName': instance.areaName,
      'partName': instance.partName,
      'title': instance.title,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'tel': instance.tel,
      'contentSeq': instance.contentSeq,
    };
