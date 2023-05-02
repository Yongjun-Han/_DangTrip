import 'package:_dangtrip/Common/Components/place_detail_card.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: PlaceDetailCard(
              image: Image.network(
                "http://www.pettravel.kr/upload/mapdata/C0001/thumb/list/C0001_F20210813134627004.jpg",
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              name: '다솜이야영장',
              ratings: 4.7,
              address: "강원도 영월군 무릉도원면 무릉법흥로 852-21",
              keyword: "춘천, 카페, 강변",
              mainFacility: "물놀이장, 개수대, 샤워장, 화장실",
              dogtype: '중형견',
              parkinglot: true,
              wifi: true,
              placeinfo: "반려견과 함께 자연을 느낄 수 있는 캠핑장입니다.",
              tel: "010-3108-3544",
              link: "09:00AM~12:00PM",
            ),
          )
        ],
      ),
    );
  }
}
