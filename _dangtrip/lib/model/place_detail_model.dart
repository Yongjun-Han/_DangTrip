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
      policyCautions,
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
    required this.policyCautions,
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
        policyCautions: json['policyCautions'],
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
