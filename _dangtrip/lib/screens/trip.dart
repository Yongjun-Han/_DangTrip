import 'package:_dangtrip/Common/Components/place_info_card.dart';
import 'package:_dangtrip/Common/const/data.dart';
import 'package:_dangtrip/model/restaurant_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Trip extends StatelessWidget {
  const Trip({super.key});

  Future<List> paginateData() async {
    final dio = Dio();
    //유효기간 5분
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    //새로 발급

    final res = await dio.get(
      'http://$ip/restaurant',
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
    return Center(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffe1e1e1)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search_rounded,
                        color: Color(0xffe1e1e1),
                        size: 24,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            '어디로 떠나시나요 ?',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffe1e1e1),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              FutureBuilder<List>(
                future: paginateData(),
                builder: (context, AsyncSnapshot<List> snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  return Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        final item = snapshot.data![index];
                        final pItem = RestaurantModel(
                          id: item['id'],
                          name: item['name'],
                          thumbUrl: 'http://$ip${item['thumbUrl']}',
                          tags: List<String>.from(item['tags']),
                          priceRange: RestaurantPriceRange.values.firstWhere(
                            (e) => e.name == item['priceRange'],
                          ),
                          ratings: item['ratings'],
                          ratingsCount: item['ratingsCount'],
                          deliveryFee: item['deliveryFee'],
                          deliveryTime: item['deliveryTime'],
                        );
                        return PlaceInfoCard(
                          image: Image.network(
                            pItem.thumbUrl,
                            fit: BoxFit.cover,
                          ),
                          name: pItem.name,
                          tags: pItem.tags,
                          ratings: pItem.ratings,
                          // dogType: '소형견',
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
