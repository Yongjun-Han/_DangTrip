class PlaceInfoModel {
  final String areaName, partName, title, address, latitude, longitude, tel;
  final int contentSeq;

  PlaceInfoModel({
    required this.contentSeq,
    required this.areaName,
    required this.partName,
    required this.title,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.tel,
  });
  factory PlaceInfoModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return PlaceInfoModel(
      contentSeq: json['contentSeq'],
      areaName: json['areaName'],
      partName: json['partName'],
      title: json['title'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      tel: json['tel'],
    );
  }
}
  // "contentSeq": 15,
  // "areaName": "춘천시",
  // "partName": "식음료",
  // "title": "카페 캐빈",
  // "address": "강원 춘천시 남면 버들길 60-7",
  // "latitude": "37.747381503046",
  // "longitude": "127.630154310527",
  // "tel": "010-2246-7491"