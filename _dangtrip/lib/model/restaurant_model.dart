import 'package:_dangtrip/Common/const/data.dart';

enum RestaurantPriceRange {
  expensive,
  medium,
  cheap,
}

class RestaurantModel {
  final String name, id, thumbUrl;
  final String area;
  final RestaurantPriceRange priceRange;
  final double ratings;
  final int ratingsCount, deliveryTime, deliveryFee;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.area,
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
      thumbUrl: 'http://$ip${json['thumbUrl']}',
      area: json['area'],
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
