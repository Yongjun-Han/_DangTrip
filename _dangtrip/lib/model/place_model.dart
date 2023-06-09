import 'package:json_annotation/json_annotation.dart';
part 'place_model.g.dart';

//flutter pub run build_runner build/watch --> 파트코드가 필요한 곳에 생성 명령어

@JsonSerializable()
class PlaceInfoModel {
  final String areaName, partName, title, address, latitude, longitude, tel;

  // @JsonKey(fromJson: jsonKeyTest)
  final int contentSeq;

  PlaceInfoModel({
    required this.contentSeq,
    required this.areaName,
    required this.partName,
    required this.title,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.tel,
  });

  factory PlaceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceInfoModelToJson(this);
}
