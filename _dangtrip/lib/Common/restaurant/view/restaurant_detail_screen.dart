import 'package:_dangtrip/Common/restaurant/component/product_card.dart';
import 'package:_dangtrip/Common/restaurant/component/restaurant_card.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:flutter/material.dart';

class RestaurantDeatilScreen extends StatelessWidget {
  const RestaurantDeatilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "불타는 떡볶이",
      child: Column(
        children: [
          RestaurantCard(
            image: Image.asset("lib/assets/banner/AD_3.png"),
            name: "청정해",
            tags: const ["스시", "연어", "일식"],
            ratingsCount: 120,
            deliveryTime: 30,
            deliveryFee: 0,
            ratings: 4.99,
            isDetail: true,
            detail: "존맛탱 초밥",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ProductCard(),
          )
        ],
      ),
    );
  }
}
