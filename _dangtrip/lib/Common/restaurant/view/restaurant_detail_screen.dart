import 'package:_dangtrip/Common/restaurant/component/product_card.dart';
import 'package:_dangtrip/Common/restaurant/component/restaurant_card.dart';
import 'package:_dangtrip/Common/restaurant/model/restaurant_detail_model.dart';
import 'package:_dangtrip/Common/restaurant/repository/restaurant_repository.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantDeatilScreen extends ConsumerWidget {
  final String id;

  const RestaurantDeatilScreen({
    required this.id,
    super.key,
  });

  // Future<RestaurantDetailModel> getRestaurantDetail(WidgetRef ref) async {
  //   return ref.watch(restaurantRepositoryProvider).getRestaurantDetail(id: id);
  // }
  // final dio = ref.watch(dioProvider);

  // final repository =
  //     RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant');
  // return repository.getRestaurantDetail(id: id);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
        title: "불타는 떡볶이",
        child: FutureBuilder<RestaurantDetailModel>(
            future: ref
                .watch(restaurantRepositoryProvider)
                .getRestaurantDetail(id: id),
            builder: (_, AsyncSnapshot<RestaurantDetailModel> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return CustomScrollView(
                slivers: [
                  renderTop(
                    model: snapshot.data!,
                  ),
                  renderLabel(),
                  renderProducts(products: snapshot.data!.products),
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
