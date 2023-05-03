import 'package:_dangtrip/Common/Components/place_info_card.dart';
import 'package:_dangtrip/Common/const/colors.dart';
import 'package:_dangtrip/Common/const/data.dart';
import 'package:_dangtrip/model/place_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Trip extends StatefulWidget {
  const Trip({super.key});

  @override
  State<Trip> createState() => _TripState();
}

class _TripState extends State<Trip> {
  Future<List> paginateData() async {
    final dio = Dio();

    final res = await dio.get(
        'https://www.pettravel.kr/api/listPart.do?page=1&pageBlock=10&partCode=PC01');
    // print(res.data);
    return res.data;
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
                height: 16,
              ),
              SizedBox(
                height: 41,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          print(category[index]);
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xffeeeeee),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(
                                  categoryIcon[index],
                                  size: 16,
                                  color: const Color(0xffafafaf),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  category[index],
                                  style: const TextStyle(
                                      color: Color(0xffafafaf),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: category.length),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 2,
                color: const Color(0xfff6f6f6),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffeeeeee),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 8, right: 16, bottom: 8),
                      child: Row(
                        children: const [
                          Text("견종"),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: PRIMARY_COLOR,
                    ),
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Text(
                          "거리순",
                          style: TextStyle(color: PRIMARY_COLOR),
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          color: PRIMARY_COLOR,
                        )
                      ],
                    ),
                  )
                ],
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
                  // print(snapshot.data![0]['resultList'].length);
                  // print(snapshot.data![0]['resultList'][0]);
                  return Expanded(
                    child: ListView.separated(
                      itemCount: snapshot.data![0]['resultList'].length,
                      itemBuilder: (_, index) {
                        final item = snapshot.data![0]['resultList'][index];
                        final parsedItem = PlaceModel(
                          contentSeq: item['contentSeq'],
                          areaName: item['areaName'],
                          partName: item['partName'],
                          title: item['title'],
                          address: item['address'],
                          latitude: item['latitude'],
                          longitude: item['longitude'],
                          tel: item['tel'],
                        );
                        return PlaceInfoCard(
                          image: Image.asset(
                            'lib/assets/banner/detail_test.png',
                            fit: BoxFit.cover,
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                          ),
                          name: parsedItem.title,
                          area: parsedItem.areaName,
                          ratings: 4.7,
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                    ),
                  );
                  // return Expanded(
                  //   child: ListView.separated(
                  //     scrollDirection: Axis.vertical,
                  //     shrinkWrap: true,
                  //     itemCount: snapshot.data!.length,
                  //     itemBuilder: (_, index) {
                  //       final item = snapshot.data![index];
                  //       final pItem = RestaurantModel.fromJson(
                  //         json: item,
                  //       );
                  //       return GestureDetector(
                  //         onTap: () {
                  //           Navigator.of(context).push(MaterialPageRoute(
                  //               builder: (_) => const PlaceDetailScreen()));
                  //         },
                  //         child: PlaceInfoCard.fromModel(
                  //           model: pItem,
                  //           // dogType: '소형견',
                  //         ),
                  //       );
                  //     },
                  //     separatorBuilder: (_, index) {
                  //       return const SizedBox(
                  //         height: 16,
                  //       );
                  //     },
                  //   ),
                  // );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
