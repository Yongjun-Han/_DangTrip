import 'package:_dangtrip/Common/Components/place_detail_card.dart';
import 'package:_dangtrip/Common/Utils/place_provider.dart';
import 'package:_dangtrip/Common/repository/place_repository.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:_dangtrip/model/place_detail_model.dart';
import 'package:_dangtrip/widgets/place_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceDetailScreen extends ConsumerWidget {
  final int contentSeq;
  final String partName;

  // Future<Map<String, dynamic>> getPlaceDetail() async {
  Future<PlaceDetailModel> getPlaceDetail(WidgetRef ref) async {
    final dio = ref.watch(dioRequestProvider);
    final category = ref.watch(categoryProvider);
    final repository =
        PlaceRepository(dio, baseUrl: 'http://www.pettravel.kr/api/');

    return repository.getPlaceDetail(
        category: category, contentSeq: contentSeq);

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
  }

  const PlaceDetailScreen({
    required this.contentSeq,
    required this.partName,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
        child: FutureBuilder<PlaceDetailModel>(
      future: getPlaceDetail(ref),
      builder: (_, AsyncSnapshot<PlaceDetailModel> snapshot) {
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
        final item = snapshot.data!;
        print(item);
        // print(item.imageList);
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PlaceDetailCard(
                image: PlaceImageSlider(
                  imageList: item.imageList,
                ),
                title: item.title,
                areaName: item.areaName,
                partName: item.partName,
                address: item.address,
                keyword: item.keyword,
                tel: item.tel,
                usedTime: item.usedTime,
                homePage: item.homePage,
                content: item.content,
                mainFacility: item.mainFacility,
                usedCost: item.usedCost,
                policyCautions: item.policyCautions,
                dogBreed: item.dogBreed,
                latitude: item.latitude,
                longitude: item.longitude,
                parkingFlag: item.parkingFlag,
              ),
            )
          ],
        );
      },
    ));
  }
}
