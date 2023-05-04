import 'package:_dangtrip/model/place_model.dart';

class PlaceDetailModel extends PlaceInfoModel {
  final String keyword,
      usedTime,
      homePage,
      content,
      mainFacility,
      usedCost,
      dogBreed,
      parkingFlag,
      imageList;

  // final List<PlaceIamgeModel> thumbs;

  PlaceDetailModel({
    required super.contentSeq,
    required super.areaName,
    required super.partName,
    required super.title,
    required super.address,
    required super.latitude,
    required super.longitude,
    required super.tel,
    required this.keyword,
    required this.usedTime,
    required this.homePage,
    required this.content,
    required this.mainFacility,
    required this.usedCost,
    required this.dogBreed,
    required this.parkingFlag,
    required this.imageList,
  });
  factory PlaceDetailModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return PlaceDetailModel(
        contentSeq: json['contentSeq'],
        areaName: json['areaName'],
        partName: json['partName'],
        title: json['title'],
        address: json['address'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        tel: json['tel'],
        keyword: json['keyword'],
        usedTime: json['usedTime'],
        homePage: json['homePage'],
        content: json['content'],
        mainFacility: json['mainFacility'],
        usedCost: json['usedCost'],
        dogBreed: json['dogBreed'],
        parkingFlag: json['parkingFlag'],
        imageList: json['imageList'][0]['image']
        // thumbs: json['thumbs'].map<PlaceIamgeModel>(
        //   (x) => PlaceIamgeModel(
        //     image: x['image'],
        //   ),
        // ),
        );
  }
}

class PlaceIamgeModel {
  final String image;
  PlaceIamgeModel({required this.image});
}
  //  {
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
// "contentSeq": 15,
//             "keyword": "춘천, 브런치, 카페, 로스팅, 커피",
//             "usedTime": "10:30 ~ 19:00",
//             "homePage": "https://m.blog.naver.com/PostList.naver?blogId=aimsoul",
//             "content": "카페캐빈은 전원 분위기와 모던한 인테리어가 잘 어우러져 있는 유럽스타일 로스터리 카페입니다.  직접 로스팅 한 고급 생두로 만든 커피와 신선한 생과일 주스, 직접 담근 차와 정성이 담긴 수제 브런치 메뉴, 베이커리류도 일품입니다.  넓은 마당에서 반려견과 함께 즐거운 시간을 보낼 수 있고 저녁에는 석양을 바라보며 아름다운 야경과 전원 카페의 여유를 만끽해보세요.",
//             "mainFacility": "- 넓은 마당 - 테라스 - 단체석 - 주차장",
//             "usedCost": "- 사과브리치즈파니니&샐러드 15,000원- 수제햄치즈파니니&샐러드 14,000원- 한우 볼로네제 파스타 15,000원- 아메리카노 4,500원- 핸드드립&프렌치프레스 8,000원",
//             "policyCautions": "- 1인 1반려견만 가능합니다 - 반려견 동반 시 실외(마당/테라스)만 이용 가능합니다. - 리드줄 필수입니다. - 반려견이 마당 잔디밭에 마킹 시 그 자리에 물을 뿌려주셔야 합니다.* 반려견 동반 운영 정책은 현지 사정에 따라 변동 될 수 있습니다.",
//             "dogBreed": "M",
//             "parkingFlag": "Y",
//             "imageList": [
//                
//             ]
