import 'package:_dangtrip/Common/const/data.dart';
import 'package:_dangtrip/Common/restaurant/component/restaurant_card.dart';
import 'package:_dangtrip/Common/restaurant/dio/dio.dart';
import 'package:_dangtrip/Common/restaurant/model/restaurant_model.dart';
import 'package:_dangtrip/Common/restaurant/repository/restaurant_repository.dart';
import 'package:_dangtrip/Common/restaurant/view/restaurant_detail_screen.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});

  Future<List<RestaurantModel>> pagenateRestaurant(WidgetRef ref) async {
    final dio = ref.watch(dioProvider);

    final res =
        await RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant')
            .paginate();

    return res.data;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: "딜리버리",
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder<List<RestaurantModel>>(
            future: pagenateRestaurant(ref),
            builder: (context, AsyncSnapshot<List<RestaurantModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final parsedItem = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => RestaurantDeatilScreen(
                            id: parsedItem.id,
                          ),
                        ),
                      );
                    },
                    child: RestaurantCard.fromModel(
                      model: parsedItem,
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    height: 24,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
