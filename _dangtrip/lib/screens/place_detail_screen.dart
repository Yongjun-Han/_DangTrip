import 'package:_dangtrip/Common/Components/place_detail_card.dart';
import 'package:_dangtrip/Common/dio/dio.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:_dangtrip/model/place_detail_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  final int contentSeq;
  final String partName;

  // Future<Map<String, dynamic>> getPlaceDetail() async {
  Future<Map<String, dynamic>> getPlaceDetail() async {
    final dio = Dio();
    late String category;

    if (partName == '식음료') {
      category = 'PC01';
    } else if (partName == '숙박') {
      category = 'PC02';
    } else if (partName == '관광지') {
      category = 'PC03';
    } else if (partName == '체험') {
      category = 'PC04';
    } else if (partName == '동물병원') {
      category = 'PC05';
    }

    dio.interceptors.add(CustomInterceptor());

    final res = await dio.get(
        'http://www.pettravel.kr/api/detailSeqPart.do?partCode=$category&contentNum=$contentSeq');
    // print(res.data[0]['resultList']);
    return res.data[0]['resultList'];
  }

  const PlaceDetailScreen({
    required this.contentSeq,
    required this.partName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: FutureBuilder<Map<String, dynamic>>(
      future: getPlaceDetail(),
      builder: (_, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        // print(snapshot.data);
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final item = PlaceDetailModel.fromJson(
          json: snapshot.data!,
        );
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: PlaceDetailCard(
                image: Image.network(
                  item.imageList,
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  fit: BoxFit.cover,
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
