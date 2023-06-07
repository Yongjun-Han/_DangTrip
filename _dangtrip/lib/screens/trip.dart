import 'package:_dangtrip/Common/Components/place_info_card.dart';
import 'package:_dangtrip/Common/Utils/cateModel.dart';
import 'package:_dangtrip/Common/Utils/place_provider.dart';
import 'package:_dangtrip/Common/Utils/select_notifier_provider.dart';
import 'package:_dangtrip/Common/const/colors.dart';
import 'package:_dangtrip/model/place_model.dart';
import 'package:_dangtrip/screens/place_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Trip extends ConsumerWidget {
  const Trip({
    super.key,
  });

  Future<List> paginateData(String pcCode) async {
    final dio = Dio();
    //장소 데이터
    final List data = [];
    //장소의 시퀀스 넘버 데이터
    final List seqArr = [];
    //장소의 썸네일 데이터
    final List thumbArr = [];

    final res = await dio
        .get(
            'https://www.pettravel.kr/api/listPart.do?page=1&pageBlock=10&partCode=$pcCode')
        .then((value) {
      data.add(value.data!); // 이미지 데이터가 없는 식음료 api 데이터 리스트
      for (int i = 0; i < value.data![0]['resultList'].length; i++) {
        seqArr.add(value.data![0]['resultList'][i]
            ['contentSeq']); //이미지 url 요청에 필요한 쿼리값 contentSeq 추출
      }
      return seqArr; //contentSeq리스트
    }).then((value) async {
      //value = seqArr
      //동물병원데이터는 api 에서 썸내일 이미지를 제공 x --> 예시미이지로 대체
      if (pcCode == 'PC05') {
        for (int i = 0; i < value.length; i++) {
          await dio
              .get(
                  'http://www.pettravel.kr/api/detailSeqPart.do?partCode=$pcCode&contentNum=${value[i]}')
              .then((value) {
            thumbArr.add(
                "https://plus.unsplash.com/premium_photo-1661954422066-36639b6f13b5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2338&q=80");
            data.add(thumbArr);
          });
        }
      } else {
        for (int i = 0; i < value.length; i++) {
          await dio
              .get(
                  'http://www.pettravel.kr/api/detailSeqPart.do?partCode=$pcCode&contentNum=${value[i]}')
              .then((value) {
            // print(value.data[0]['resultList']['imageList'][0]['image']);
            thumbArr.add(value.data[0]['resultList']['imageList'][0]['image']);
            data.add(thumbArr); // 썸네일 데이터 추가
          });
        }
      }
    });
    // print(data[1]);
    // print(data);
    return data;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoryProvider);
    final List<CategoryModel> selectState = ref.watch(selectProvider);

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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: selectState
                      .map(
                        (e) => Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                ref.read(categoryProvider.notifier).update(
                                  (state) {
                                    late String placecategory;
                                    if (e.name == '식음료') {
                                      placecategory = 'PC01';
                                    } else if (e.name == '숙박') {
                                      placecategory = 'PC02';
                                    } else if (e.name == '관광지') {
                                      placecategory = 'PC03';
                                    } else if (e.name == '체험') {
                                      placecategory = 'PC04';
                                    } else if (e.name == '동물병원') {
                                      placecategory = 'PC05';
                                    }
                                    return placecategory;
                                  },
                                );
                                ref
                                    .read(selectProvider.notifier)
                                    .isSelected(name: e.name);
                              },
                              style: ButtonStyle(
                                elevation: const MaterialStatePropertyAll(0),
                                backgroundColor: MaterialStatePropertyAll(
                                    e.isSelected ? PRIMARY_COLOR : TEXT_DIMMED),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(e.name),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            )
                          ],
                        ),
                      )
                      .toList(),
                ),
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
                future: paginateData(state),
                builder: (context, AsyncSnapshot<List> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

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

                          // (ref.read(categoryProvider) == "PC05")
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
