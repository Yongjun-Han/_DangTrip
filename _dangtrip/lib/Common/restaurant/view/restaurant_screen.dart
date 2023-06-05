import 'package:_dangtrip/Common/model/cursor_pagination_model.dart';
import 'package:_dangtrip/Common/restaurant/component/restaurant_card.dart';
import 'package:_dangtrip/Common/restaurant/provider/restaurant_provider.dart';
import 'package:_dangtrip/Common/restaurant/view/restaurant_detail_screen.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(restaurantProvider);
    if (data is CursorPagintionLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final cp = data as CursorPagintion;

    return DefaultLayout(
      title: "딜리버리",
      child: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
              itemCount: cp.data.length,
              itemBuilder: (_, index) {
                final parsedItem = cp.data[index];
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
            )),
      ),
    );
  }
}
