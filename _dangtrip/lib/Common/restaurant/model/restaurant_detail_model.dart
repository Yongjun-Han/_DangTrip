//레스토랑 페이지와 디테일 페이지는 겹치는 내용이 많음 -> extends
import 'package:_dangtrip/Common/const/data.dart';
import 'package:_dangtrip/Common/restaurant/model/restaurant_model.dart';

class RestaurantDetailModel extends RestaurantModel {
  final String detail;
  final List<RestaurantProductModel> products;

  RestaurantDetailModel({
    required super.id,
    required super.name,
    required super.thumbUrl,
    required super.tags,
    required super.priceRange,
    required super.ratings,
    required super.ratingsCount,
    required super.deliveryFee,
    required super.deliveryTime,
    required this.detail,
    required this.products,
  });
  factory RestaurantDetailModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantDetailModel(
      id: json["id"],
      name: json["name"],
      thumbUrl: "http://$ip/${json['thumbUrl']}",
      tags: List<String>.from(json['tags']),
      priceRange: RestaurantPriceRange.values.firstWhere(
        (e) => e.name == json['priceRange'],
      ),
      ratings: json["ratings"],
      ratingsCount: json["ratingsCount"],
      deliveryFee: json["deliveryFee"],
      deliveryTime: json["deliveryTime"],
      detail: json["detail"],
      products: json["products"]
          .map<RestaurantProductModel>(
            (x) => RestaurantProductModel.fromJson(json: x),
          )
          .toList(),
    );
  }
}

class RestaurantProductModel {
  final String id, name, imgUrl, detail;
  final int price;
  RestaurantProductModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.detail,
    required this.price,
  });

  factory RestaurantProductModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantProductModel(
      id: json['id'],
      name: json['name'],
      imgUrl: "http://$ip${json['imgUrl']}",
      detail: json['detail'],
      price: json['price'],
    );
  }
}
