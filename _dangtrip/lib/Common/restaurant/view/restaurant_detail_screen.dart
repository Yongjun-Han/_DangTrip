import 'package:_dangtrip/Common/const/data.dart';
import 'package:_dangtrip/Common/dio/dio.dart';
import 'package:_dangtrip/Common/restaurant/component/product_card.dart';
import 'package:_dangtrip/Common/restaurant/component/restaurant_card.dart';
import 'package:_dangtrip/Common/restaurant/model/restaurant_detail_model.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantDeatilScreen extends StatelessWidget {
  final String id;

  const RestaurantDeatilScreen({
    required this.id,
    super.key,
  });

  Future<Map<String, dynamic>> getRestaurantDetail() async {
    final dio = Dio();
    dio.interceptors.add(CustomInterceptor());
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final res = await dio.get(
      "http://$ip/restaurant/$id",
      options: Options(
        headers: {
          "authorization": "Bearer $accessToken",
        },
      ),
    );
    return res.data;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: "불타는 떡볶이",
        child: FutureBuilder<Map<String, dynamic>>(
            future: getRestaurantDetail(),
            builder: (_, AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final item = RestaurantDetailModel.fromJson(
                json: snapshot.data!,
              );
              return CustomScrollView(
                slivers: [
                  renderTop(
                    model: item,
                  ),
                  renderLabel(),
                  renderProducts(products: item.products),
                ],
              );
            }));
  }

  SliverToBoxAdapter renderTop({
    required RestaurantDetailModel model,
  }) {
    return SliverToBoxAdapter(
      child: RestaurantCard.fromModel(
        model: model,
        isDetail: true,
      ),
    );
  }

  SliverPadding renderProducts(
      {required List<RestaurantProductModel> products}) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final model = products[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ProductCard.fromModel(model: model),
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }

  SliverPadding renderLabel() {
    return const SliverPadding(
      padding: EdgeInsets.only(left: 16, bottom: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          "메뉴",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
