import 'package:_dangtrip/model/place_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'place_detail_model.g.dart';

@JsonSerializable()
class PlaceDetailModel extends PlaceInfoModel {
  final String keyword,
      usedTime,
      homePage,
      content,
      mainFacility,
      usedCost,
      dogBreed,
      parkingFlag,
      policyCautions;

  // @JsonKey(fromJson: imageListToString)
  final List<dynamic> imageList;

  // final List<PlaceIamgeModel> thumbs;

  PlaceDetailModel({
    required super.contentSeq,
    required super.areaName,
    required super.partName,
    required super.title,
    required super.address,
    required super.latitude,
    required super.longitude,
    required super.tel,
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
  });

  factory PlaceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailModelFromJson(json);

  static imageListToString(List value) {
    return value[0]['image'];
  }
}

class PlaceIamgeModel {
  final String image;
  PlaceIamgeModel({required this.image});
}
