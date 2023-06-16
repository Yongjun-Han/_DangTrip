import 'package:_dangtrip/Common/Components/place_detail_card.dart';
import 'package:_dangtrip/Common/Utils/place_provider.dart';
import 'package:_dangtrip/Common/const/colors.dart';
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
    final category = ref.watch(categoryProvider);
    return ref
        .watch(placeRepositoryProvider)
        .getPlaceDetail(category: category, contentSeq: contentSeq);
  }

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
            SliverAppBar(
              title: Text(
                item.resultList.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  shadows: [Shadow(color: Colors.black26, blurRadius: 5)],
                ),
              ),
              backgroundColor: SECONDARY_COLOR,
              expandedHeight: 300,
              floating: true,
              pinned: true,
              shadowColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background:
                    PlaceImageSlider(imageList: item.resultList.imageList),
              ),
            ),
            SliverToBoxAdapter(
              child: PlaceDetailCard(
                // image: PlaceImageSlider(
                //   imageList: item.resultList.imageList,
                // ),
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
