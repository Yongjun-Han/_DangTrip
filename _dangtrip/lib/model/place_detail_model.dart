import 'package:json_annotation/json_annotation.dart';
part 'place_detail_model.g.dart';

//실제로 활용할 api 데이터의 모델
@JsonSerializable()
class PlaceDetailModel {
  final int contentSeq;
  final String areaName,
      partName,
      title,
      keyword,
      address,
      latitude,
      longitude,
      tel,
      usedTime,
      homePage,
      content,
      mainFacility,
      usedCost,
      dogBreed,
      parkingFlag,
      policyCautions,
      provisionSupply,
      petFacility,
      restaurant,
      parkingLog,
      emergencyResponse,
      memo,
      bathFlag,
      provisionFlag,
      petFlag,
      petWeight,
      emergencyFlag,
      entranceFlag,
      inOutFlag;

  final List<Map<String, String>> imageList;

  PlaceDetailModel({
    required this.contentSeq,
    required this.areaName,
    required this.partName,
    required this.title,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.tel,
    required this.keyword,
    required this.usedTime,
    required this.homePage,
    required this.content,
    required this.mainFacility,
    required this.usedCost,
    required this.dogBreed,
    required this.parkingFlag,
    required this.imageList,
    required this.policyCautions,
    required this.provisionSupply,
    required this.petFacility,
    required this.restaurant,
    required this.parkingLog,
    required this.emergencyResponse,
    required this.memo,
    required this.bathFlag,
    required this.provisionFlag,
    required this.petFlag,
    required this.petWeight,
    required this.emergencyFlag,
    required this.entranceFlag,
    required this.inOutFlag,
  });

  factory PlaceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailModelFromJson(json);
}
