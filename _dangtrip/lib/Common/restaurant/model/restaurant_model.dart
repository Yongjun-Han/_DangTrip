import 'package:_dangtrip/Common/Utils/data_utils.dart';
import 'package:_dangtrip/Common/const/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'restaurant_model.g.dart';

enum RestaurantPriceRange {
  expensive,
  medium,
  cheap,
}

@JsonSerializable()
class RestaurantModel {
  final String id, name;
  @JsonKey(
    fromJson: DataUtils.pathToUrl,
    // toJson: ,
  )
  final String thumbUrl;
  final List<String> tags;
  final RestaurantPriceRange priceRange;
  final double ratings;
  final int ratingsCount, deliveryFee, deliveryTime;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryFee,
    required this.deliveryTime,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);

  static pathToUrl(String value) {
    //value 는 jsonkey 를 적용해줄 thumbUrl
    return "http://$ip/$value";
  } // factory RestaurantModel.fromJson({
}
