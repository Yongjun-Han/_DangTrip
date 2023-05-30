import 'package:_dangtrip/Common/Components/place_info_card.dart';
import 'package:_dangtrip/Common/const/colors.dart';
import 'package:_dangtrip/Common/const/data.dart';
import 'package:_dangtrip/Common/dio/dio.dart';
import 'package:_dangtrip/model/place_model.dart';
import 'package:_dangtrip/screens/place_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Trip extends StatefulWidget {
  const Trip({
    super.key,
  });

  @override
  State<Trip> createState() => _TripState();
}

class _TripState extends State<Trip> {
  Future<List> paginateData(String pcCode) async {
    final dio = Dio();
    //장소 데이터
    final List data = [];
    //장소의 시퀀스 넘버 데이터
    final List seqArr = [];
    //장소의 썸네일 데이터
    final List thumbArr = [];

    dio.interceptors.add(CustomInterceptor());

    final res = await dio
        .get(
            'https://www.pettravel.kr/api/listPart.do?page=1&pageBlock=10&partCode=$pcCode')
        .then((value) {
      data.add(value.data!);
      for (int i = 0; i < value.data![0]['resultList'].length; i++) {
        seqArr.add(value.data![0]['resultList'][i]['contentSeq']);
      }
      return seqArr; //컨텐츠 시퀀스 번호 배열
    }).then((value) async {
      for (int i = 0; i < value.length; i++) {
        final res2 = await dio
            .get(
                'http://www.pettravel.kr/api/detailSeqPart.do?partCode=$pcCode&contentNum=${value[i]}')
            .then((value) {
          // print(value.data[0]['resultList']['imageList'][0]['image']);
          thumbArr.add(value.data[0]['resultList']['imageList'][0]['image']);
          // print(thumbArr);
          data.add(thumbArr);
        });
      }
    });
    // print(data[1]);
    return data;
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
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 20, top: 8, right: 16, bottom: 8),
                      child: Row(
                        children: [
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
                    child: const Row(
                      children: [
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
                future: paginateData('PC01'),
                builder: (context, AsyncSnapshot<List> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // print(snapshot.data![0]['resultList'].length);
                  // print(snapshot.data![0]['resultList'][0]);
                  return Expanded(
                    child: ListView.separated(
                      itemCount: snapshot.data![0][0]['resultList'].length,
                      itemBuilder: (_, index) {
                        final item = snapshot.data![0][0]['resultList'][index];
                        // print(snapshot.data![1]);
                        final thumbItem = snapshot.data![1];
                        final parsedItem = PlaceInfoModel.fromJson(item);
                        //장소 카드 리스트의 카드
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => PlaceDetailScreen(
                                      contentSeq: parsedItem.contentSeq,
                                      partName: parsedItem.partName,
                                    )));
                          },
                          child: PlaceInfoCard(
                            contentSeq: parsedItem.contentSeq,
                            image: Image.network(
                              thumbItem[index],
                              // thumbImage() as String,
                              fit: BoxFit.cover,
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                            ),
                            name: parsedItem.title,
                            area: parsedItem.areaName,
                            ratings: 4.7,
                          ),
                        );
                        // model: parsedItem,
                      },
                      separatorBuilder: (_, index) {
                        return const SizedBox(
                          height: 8,
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
