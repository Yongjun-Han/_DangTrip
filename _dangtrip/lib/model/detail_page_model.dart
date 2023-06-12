import 'package:_dangtrip/model/place_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'detail_page_model.g.dart';

@JsonSerializable()
class DetailPageModel {
  final PlaceDetailModel resultList;
  final String message;

  DetailPageModel({
    required this.resultList,
    required this.message,
  });

  factory DetailPageModel.fromJson(Map<String, dynamic> json) =>
      _$DetailPageModelFromJson(json);
}
