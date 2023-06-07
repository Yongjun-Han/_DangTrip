// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailModel _$PlaceDetailModelFromJson(Map<String, dynamic> json) =>
    PlaceDetailModel(
      contentSeq: json['contentSeq'] as int,
      areaName: json['areaName'] as String,
      partName: json['partName'] as String,
      title: json['title'] as String,
      address: json['address'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      tel: json['tel'] as String,
      keyword: json['keyword'] as String,
      usedTime: json['usedTime'] as String,
      homePage: json['homePage'] as String,
      content: json['content'] as String,
      mainFacility: json['mainFacility'] as String,
      usedCost: json['usedCost'] as String,
      dogBreed: json['dogBreed'] as String,
      parkingFlag: json['parkingFlag'] as String,
      imageList: json['imageList'] as List<dynamic>,
      policyCautions: json['policyCautions'] as String,
    );

Map<String, dynamic> _$PlaceDetailModelToJson(PlaceDetailModel instance) =>
    <String, dynamic>{
      'areaName': instance.areaName,
      'partName': instance.partName,
      'title': instance.title,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'tel': instance.tel,
      'contentSeq': instance.contentSeq,
      'keyword': instance.keyword,
      'usedTime': instance.usedTime,
      'homePage': instance.homePage,
      'content': instance.content,
      'mainFacility': instance.mainFacility,
      'usedCost': instance.usedCost,
      'dogBreed': instance.dogBreed,
      'parkingFlag': instance.parkingFlag,
      'policyCautions': instance.policyCautions,
      'imageList': instance.imageList,
    };
