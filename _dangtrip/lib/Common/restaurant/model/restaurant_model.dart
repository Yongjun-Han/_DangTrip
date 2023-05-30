import 'package:_dangtrip/Common/const/data.dart';

enum RestaurantPriceRange { expensive, medium, cheap }

class RestaurantModel {
  final String id, name, thumbUrl;
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

  factory RestaurantModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      thumbUrl: "http://$ip/${json['thumbUrl']}",
      tags: List.from(json['tags']),
      priceRange: RestaurantPriceRange.values.firstWhere(
        (e) => e.name == json['priceRange'],
      ),
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
      deliveryFee: json['deliveryFee'],
      deliveryTime: json['deliveryTime'],
    );
  }
}
