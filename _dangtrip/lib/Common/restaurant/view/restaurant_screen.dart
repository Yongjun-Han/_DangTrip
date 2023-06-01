import 'package:_dangtrip/Common/const/data.dart';
import 'package:_dangtrip/Common/dio/dio.dart';
import 'package:_dangtrip/Common/restaurant/component/restaurant_card.dart';
import 'package:_dangtrip/Common/restaurant/model/restaurant_model.dart';
import 'package:_dangtrip/Common/restaurant/view/restaurant_detail_screen.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List> pagenateRestaurant() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    print(accessToken);
    dio.interceptors.add(CustomInterceptor());
    final res = await dio.get(
      "http://$ip/restaurant",
      options: Options(
        headers: {
          'authorization': 'Bearer $accessToken',
        },
      ),
    );
    return res.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "딜리버리",
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder<List>(
            future: pagenateRestaurant(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final item = snapshot.data![index];
                  final parsedItem = RestaurantModel.fromJson(item);
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
