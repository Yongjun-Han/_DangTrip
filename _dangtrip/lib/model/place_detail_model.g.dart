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
      imageList: (json['imageList'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      policyCautions: json['policyCautions'] as String,
      provisionSupply: json['provisionSupply'] as String,
      petFacility: json['petFacility'] as String,
      restaurant: json['restaurant'] as String,
      parkingLog: json['parkingLog'] as String,
      emergencyResponse: json['emergencyResponse'] as String,
      memo: json['memo'] as String,
      bathFlag: json['bathFlag'] as String,
      provisionFlag: json['provisionFlag'] as String,
      petFlag: json['petFlag'] as String,
      petWeight: json['petWeight'] as String,
      emergencyFlag: json['emergencyFlag'] as String,
      entranceFlag: json['entranceFlag'] as String,
      inOutFlag: json['inOutFlag'] as String,
    );

Map<String, dynamic> _$PlaceDetailModelToJson(PlaceDetailModel instance) =>
    <String, dynamic>{
      'contentSeq': instance.contentSeq,
      'areaName': instance.areaName,
      'partName': instance.partName,
      'title': instance.title,
      'keyword': instance.keyword,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'tel': instance.tel,
      'usedTime': instance.usedTime,
      'homePage': instance.homePage,
      'content': instance.content,
      'mainFacility': instance.mainFacility,
      'usedCost': instance.usedCost,
      'dogBreed': instance.dogBreed,
      'parkingFlag': instance.parkingFlag,
      'policyCautions': instance.policyCautions,
      'provisionSupply': instance.provisionSupply,
      'petFacility': instance.petFacility,
      'restaurant': instance.restaurant,
      'parkingLog': instance.parkingLog,
      'emergencyResponse': instance.emergencyResponse,
      'memo': instance.memo,
      'bathFlag': instance.bathFlag,
      'provisionFlag': instance.provisionFlag,
      'petFlag': instance.petFlag,
      'petWeight': instance.petWeight,
      'emergencyFlag': instance.emergencyFlag,
      'entranceFlag': instance.entranceFlag,
      'inOutFlag': instance.inOutFlag,
      'imageList': instance.imageList,
    };
