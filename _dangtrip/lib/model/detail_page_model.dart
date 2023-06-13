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

//retrofit 용 모델 
//api 응답 결과와 정확하게 맞추기 위해 
