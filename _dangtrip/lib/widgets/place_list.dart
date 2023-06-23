import 'package:_dangtrip/Common/Components/place_info_card.dart';
import 'package:_dangtrip/Common/Utils/place_provider.dart';
import 'package:_dangtrip/Common/Utils/place_state_noti.dart';
import 'package:_dangtrip/screens/place_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceListWidget extends ConsumerWidget {
  const PlaceListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(PlaceProvider);

    //썸네일 요청용
    Future<List<dynamic>> getThumb(String pcCode) async {
      late List thumbArr = [];
      final dio = Dio();
      if (pcCode == 'PC05') {
        for (int i = 0; i < data.length; i++) {
          thumbArr.add(
              "https://plus.unsplash.com/premium_photo-1661954422066-36639b6f13b5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2338&q=80");
        }
      } else {
        for (int i = 0; i < data.length; i++) {
          await dio
              .get(
                  'http://www.pettravel.kr/api/detailSeqPart.do?partCode=$pcCode&contentNum=${data[i].contentSeq}')
              .then((value) {
            thumbArr.add(
                value.data[0]['resultList']['imageList'][0]['image']); //이미지 링크
          });
        }
      }
      return thumbArr;
    }

    final categoryState = ref.watch(categoryProvider);

    if (data.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Consumer(
      builder: (context, ref, child) {
        return Expanded(
          child: ListView.separated(
            itemCount: data.length,
            itemBuilder: (_, index) {
              final item = data[index];
              // final thumbItem = getThumb(categoryState);
              //장소 카드 리스트의 카드
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => PlaceDetailScreen(
                        contentSeq: item.contentSeq,
                        partName: item.partName,
                      ),
                    ),
                  );
                },
                child: PlaceInfoCard(
                  contentSeq: item.contentSeq,
                  image: FutureBuilder(
                    future: getThumb(categoryState),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          color: const Color.fromARGB(255, 234, 234, 234),
                        );
                      }
                      return Image.network(
                        snapshot.data![index],
                        fit: BoxFit.cover,
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                      );
                    },
                  ),
                  name: item.title,
                  area: item.areaName,
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
    );
  }
}
