import 'package:_dangtrip/Common/Components/place_info_card.dart';
import 'package:_dangtrip/Common/Utils/place_provider.dart';
import 'package:_dangtrip/Common/Utils/place_state_notifier.dart';
import 'package:_dangtrip/model/place_cursor_pagination_model.dart';
import 'package:_dangtrip/screens/place_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceListWidget extends ConsumerStatefulWidget {
  const PlaceListWidget({super.key});

  @override
  ConsumerState<PlaceListWidget> createState() => _PlaceListWidgetState();
}

class _PlaceListWidgetState extends ConsumerState<PlaceListWidget> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(scrollListener);
  }

  void scrollListener() {
    //현재 위치가 최대값 보다 조금 덜되는 위치라면 새로운 데이터 요청
    if (controller.offset > controller.position.maxScrollExtent - 150) {
      ref.read(placeProvider.notifier).paginate(
            fetchMore: true,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    //썸네일 데이터를 제외한 업체 데이터 리스트
    final data = ref.watch(placeProvider);

    //썸네일 요청용
    Future<List<dynamic>> getThumb(String pcCode) async {
      late List thumbArr = [];
      final dio = Dio();

      if (data is PlaceCursorPagination) {
        if (pcCode == 'PC05') {
          for (int i = 0; i < data.resultList.length; i++) {
            thumbArr.add(
                "https://plus.unsplash.com/premium_photo-1661954422066-36639b6f13b5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2338&q=80");
          }
        } else {
          for (int i = 0; i < data.resultList.length; i++) {
            await dio
                .get(
                    'http://www.pettravel.kr/api/detailSeqPart.do?partCode=$pcCode&contentNum=${data.resultList[i].contentSeq}')
                .then((value) {
              thumbArr.add(value.data[0]['resultList']['imageList'][0]
                  ['image']); //이미지 링크
            });
          }
        }
      }
      // ref.read(contentPageProvider.notifier).update((state) => state + 10);
      return thumbArr;
    }

    final categoryState = ref.watch(categoryProvider);
    //초기로딩
    if (data is PlaceCursorPaginationLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    //에러발생시
    if (data is PlaceCursorPaginationError) {
      return Center(
        child: Text(data.message),
      );
    }

    // PlaceCursorPagination;
    // PlaceCursorPaginationFetchingMore;
    // PlaceCursorPaginationRefetching;
    final cp = data as PlaceCursorPagination;

    return Consumer(
      builder: (context, ref, child) {
        return Expanded(
          child: ListView.separated(
            controller: controller,
            itemCount: cp.resultList.length + 1,
            itemBuilder: (_, index) {
              if (index == cp.resultList.length) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Center(
                    child: data is PlaceCursorPaginationFetchingMore
                        ? const CircularProgressIndicator()
                        : const Text("더이상 데이터가 없습니다."),
                  ),
                );
              }
              final item = cp.resultList[index];
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
