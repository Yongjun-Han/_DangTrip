import 'package:_dangtrip/model/place_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceStateNotifier extends StateNotifier<List<PlaceInfoModel>> {
  PlaceStateNotifier() : super([]) {
    paginateData('PC01');
  }

  Future<List> paginateData(String pcCode) async {
    final dio = Dio();
    //장소 데이터
    final List state = [];
    //장소의 시퀀스 넘버 데이터
    final List seqArr = [];
    //장소의 썸네일 데이터
    final List thumbArr = [];

    final res = await dio
        .get(
            'https://www.pettravel.kr/api/listPart.do?page=1&pageBlock=10&partCode=$pcCode')
        .then((value) {
      state.add(value.data!);
      for (int i = 0; i < value.data![0]['resultList'].length; i++) {
        seqArr.add(value.data![0]['resultList'][i]['contentSeq']);
      }
      return seqArr; //컨텐츠 시퀀스 번호 배열
    }).then((value) async {
      for (int i = 0; i < value.length; i++) {
        final res2 = await dio
            .get(
                'http://www.pettravel.kr/api/detailSeqPart.do?partCode=$pcCode&contentNum=${value[i]}')
            .then((value) {
          // print(value.data[0]['resultList']['imageList'][0]['image']);
          thumbArr.add(value.data[0]['resultList']['imageList'][0]['image']);
          // print(thumbArr);
          state.add(thumbArr);
        });
      }
    });
    // print(data[1]);
    return state;
  }
}
