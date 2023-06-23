import 'dart:math';

import 'package:_dangtrip/Common/repository/place_repository.dart';
import 'package:_dangtrip/screens/discount_detail_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiscountPlace extends ConsumerWidget {
  const DiscountPlace({super.key});

  Future<Map<String, dynamic>> getDiscountPlace(
      String pcCode, int page, WidgetRef ref) async {
    final dio = Dio();

    //반환해줄값
    final Map<String, dynamic> placedata = {};
    //가게명 데이터
    final List titleArr = [];

    final List partNameArr = [];

    //추가요청용 장소의 시퀀스 넘버 데이터
    final List seqarr = [];
    //장소의 썸네일 데이터
    final List thumbArr = [];
    //장소의 썸네일 데이터
    final List addressArr = [];

    await PlaceRepository(dio, baseUrl: 'https://www.pettravel.kr/api')
        .paginate(page: page, pcCode: pcCode, pageBlock: 10)
        .then((value) {
      // print(placedata['data']);
      for (int i = 0; i < value[0].resultList.length; i++) {
        titleArr.add(value[0].resultList[i].title);
        partNameArr.add(value[0].resultList[i].partName);
        addressArr.add(value[0].resultList[i].address);

        // placedata['title$i'] = value[0].resultList[i].title;
        seqarr.add(value[0].resultList[i].contentSeq);
      }
      // print(titleArr);
      placedata['part'] = partNameArr;
      placedata['title'] = titleArr;
      placedata['seq'] = seqarr;
      placedata['address'] = addressArr;

      // print(placedata);
      // print(seqarr);
      return seqarr;
    }).then((value) async {
      // print(value);
      for (int i = 0; i < value.length; i++) {
        await dio
            .get(
                'http://www.pettravel.kr/api/detailSeqPart.do?partCode=$pcCode&contentNum=${value[i]}')
            .then((value) {
          // print(value.data[0]['resultList']['imageList'][0]['image']);
          thumbArr.add(
              value.data[0]['resultList']['imageList'][0]['image']); //이미지 링크
          placedata['thumbUrl'] = thumbArr;
        });
      }
    });
    // print(placedata);
    return placedata;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Random random = Random();
    final int randomNumber = random.nextInt(120);
    final discountArr = [];

    for (int i = 0; i < 20; i++) {
      final int dicountNumber = random.nextInt(50) + 10;
      discountArr.add(dicountNumber);
    }
    // print(discountArr);
    // getHotPlace("PC01", randomNumber);
    // final dio = ref.watch(dioRequestProvider);
    // const repository =

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          // HotPlaceCard(
          //   imageUrl: 'lib/assets/banner/AD_5.png',
          //   title: '디얼투데이',
          // )
          FutureBuilder<Map<String, dynamic>>(
            future: getDiscountPlace("PC02", randomNumber, ref),
            builder: ((context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
              // print("FFF${snapshot.data}");

              if (!snapshot.hasData) {
                return Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 300,
                              height: 250,
                              color: const Color.fromARGB(255, 234, 234, 234),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 148,
                              height: 16,
                              color: const Color.fromARGB(255, 234, 234, 234),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (_, index) {
                      return const SizedBox(
                        width: 16,
                      );
                    },
                  ),
                );
              }
              return Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      // itemCount: snapshot.data!['title'].length,
                      itemBuilder: (_, index) {
                        final item = snapshot.data!['title'][index];
                        // print(item);
                        final seqItem = snapshot.data!['seq'][index];
                        // final partItem = snapshot.data!['part'][index];
                        // print(partItem);
                        final thumbItem = snapshot.data!['thumbUrl'][index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => DiscountDetailScreen(
                                  contentSeq: seqItem,
                                  partName: "PC02",
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  thumbItem,
                                  width: 300,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${discountArr[index].toString()}%",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: discountArr[index] > 35
                                          ? Colors.pink
                                          : Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    item,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const SizedBox(
                          width: 16,
                        );
                      }));
            }),
          ),
        ],
      ),
    );
  }
}
