import 'package:_dangtrip/Common/Components/place_detail_card.dart';
import 'package:_dangtrip/Common/Utils/place_provider.dart';
import 'package:_dangtrip/Common/repository/place_repository.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:_dangtrip/model/detail_page_model.dart';
import 'package:_dangtrip/widgets/place_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceDetailScreen extends ConsumerWidget {
  final int contentSeq;
  final String partName;

  // Future<Map<String, dynamic>> getDetail() async {
  Future<List<DetailPageModel>> getDetail(WidgetRef ref, int contentSeq) async {
    final dio = ref.watch(dioRequestProvider);
    // final dio = Dio();
    // dio.interceptors.add(
    //   CustomInterceptor(storage: storage),
    // );
    final category = ref.watch(categoryProvider);
    final repository =
        PlaceRepository(dio, baseUrl: 'http://www.pettravel.kr/api/');

    return repository.getPlaceDetail(
      category: category,
      contentSeq: contentSeq,
    );
  }
  // if (partName == '식음료') {
  //   category = 'PC01';
  // } else if (partName == '숙박') {
  //   category = 'PC02';
  // } else if (partName == '관광지') {
  //   category = 'PC03';
  // } else if (partName == '체험') {
  //   category = 'PC04';
  // } else if (partName == '동물병원') {
  //   category = 'PC05';
  // }

  // final res = await dio.get(
  //     'http://www.pettravel.kr/api/detailSeqPart.do?partCode=$category&contentNum=$contentSeq');
  // // print(res.data[0]['resultList']);
  // return res.data[0]['resultList'];

  const PlaceDetailScreen({
    required this.contentSeq,
    required this.partName,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
        child: FutureBuilder<List<DetailPageModel>>(
      future: getDetail(ref, contentSeq),
      builder: (_, AsyncSnapshot<List<DetailPageModel>> snapshot) {
        // print(snapshot.data);
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final item = snapshot.data![0];
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PlaceDetailCard(
                image: PlaceImageSlider(
                  imageList: item.resultList.imageList,
                ),
                title: item.resultList.title,
                areaName: item.resultList.areaName,
                partName: item.resultList.partName,
                address: item.resultList.address,
                keyword: item.resultList.keyword,
                tel: item.resultList.tel,
                usedTime: item.resultList.usedTime,
                homePage: item.resultList.homePage,
                content: item.resultList.content,
                mainFacility: item.resultList.mainFacility,
                usedCost: item.resultList.usedCost,
                policyCautions: item.resultList.policyCautions,
                dogBreed: item.resultList.dogBreed,
                latitude: item.resultList.latitude,
                longitude: item.resultList.longitude,
                parkingFlag: item.resultList.parkingFlag,
              ),
            )
          ],
        );
      },
    ));
  }
}
