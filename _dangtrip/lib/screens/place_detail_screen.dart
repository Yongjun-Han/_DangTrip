import 'package:_dangtrip/Common/Components/place_detail_card.dart';
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
          return Container();
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


// "resultList": {
//             "contentSeq": 15,
//             "areaName": "춘천시",
//             "partName": "식음료",
//             "title": "카페 캐빈",
//             "keyword": "춘천, 브런치, 카페, 로스팅, 커피",
//             "address": "강원 춘천시 남면 버들길 60-7",
//             "latitude": "37.747381503046",
//             "longitude": "127.630154310527",
//             "tel": "010-2246-7491",
//             "usedTime": "10:30 ~ 19:00",
//             "homePage": "https://m.blog.naver.com/PostList.naver?blogId=aimsoul",
//             "content": "카페캐빈은 전원 분위기와 모던한 인테리어가 잘 어우러져 있는 유럽스타일 로스터리 카페입니다.  직접 로스팅 한 고급 생두로 만든 커피와 신선한 생과일 주스, 직접 담근 차와 정성이 담긴 수제 브런치 메뉴, 베이커리류도 일품입니다.  넓은 마당에서 반려견과 함께 즐거운 시간을 보낼 수 있고 저녁에는 석양을 바라보며 아름다운 야경과 전원 카페의 여유를 만끽해보세요.",
//             "provisionSupply": "",
//             "petFacility": "",
//             "restaurant": "",
//             "parkingLog": "",
//             "mainFacility": "- 넓은 마당 - 테라스 - 단체석 - 주차장",
//             "usedCost": "- 사과브리치즈파니니&샐러드 15,000원- 수제햄치즈파니니&샐러드 14,000원- 한우 볼로네제 파스타 15,000원- 아메리카노 4,500원- 핸드드립&프렌치프레스 8,000원",
//             "policyCautions": "- 1인 1반려견만 가능합니다 - 반려견 동반 시 실외(마당/테라스)만 이용 가능합니다. - 리드줄 필수입니다. - 반려견이 마당 잔디밭에 마킹 시 그 자리에 물을 뿌려주셔야 합니다.* 반려견 동반 운영 정책은 현지 사정에 따라 변동 될 수 있습니다.",
//             "emergencyResponse": "",
//             "memo": "",
//             "bathFlag": "N",
//             "provisionFlag": "N",
//             "petFlag": "N",
//             "petWeight": "",
//             "dogBreed": "M",
//             "emergencyFlag": "N",
//             "entranceFlag": "N",
//             "parkingFlag": "Y",
//             "inOutFlag": "IN",
//             "message": "S000",
//             "imageList": [
//                 {
//                     "image": "http://www.pettravel.kr/upload/mapdata/C0015/thumb/list/C0015_F20210818171541001.jpg"
//                 },
//                 {
//                     "image": "http://www.pettravel.kr/upload/mapdata/C0015/thumb/list/C0015_F20210818171547002.jpg"
//                 },
//                 {
//                     "image": "http://www.pettravel.kr/upload/mapdata/C0015/thumb/list/C0015_F20210818171552003.jpg"
//                 },
//                 {
//                     "image": "http://www.pettravel.kr/upload/mapdata/C0015/thumb/list/C0015_F20210818171557004.jpg"
//                 },
//                 {
//                     "image": "http://www.pettravel.kr/upload/mapdata/C0015/thumb/list/C0015_F20210818171602005.jpg"
//                 },
//                 {
//                     "image": "http://www.pettravel.kr/upload/mapdata/C0015/thumb/list/C0015_F20210818171607006.jpg"
//                 },
//                 {
//                     "image": "http://www.pettravel.kr/upload/mapdata/C0015/thumb/list/C0015_F20210818171611007.jpg"
//                 },
//                 {
//                     "image": "http://www.pettravel.kr/upload/mapdata/C0015/thumb/list/C0015_F20210818171616008.jpg"
//                 },
//                 {
//                     "image": "http://www.pettravel.kr/upload/mapdata/C0015/thumb/list/C0015_F20210818171621009.jpg"
//                 },
//                 {
//                     "image": "http://www.pettravel.kr/upload/mapdata/C0015/thumb/list/C0015_F20210818171627010.jpg"
//                 }
//             ]
//         },