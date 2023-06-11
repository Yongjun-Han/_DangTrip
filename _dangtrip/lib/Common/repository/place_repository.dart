import 'package:_dangtrip/model/place_detail_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'place_repository.g.dart';

//retrofit 의 작성법 이다 외우면된다
@RestApi()
abstract class PlaceRepository {
  factory PlaceRepository(Dio dio, {String baseUrl}) = _PlaceRepository;

  // //https://www.pettravel.kr/api/listPart.do?page=1&pageBlock=10&partCode=$pcCode'
  // @GET('/listPart.do?page={page}&pageBlock=10&partCode={pcCode}')
  // Future<PlaceCursorPagination<PlaceInfoModel>> paginate({
  //   @Path('page') required int page,
  //   @Path('pcCode') required String pcCode,
  // });

  //'http://www.pettravel.kr/api/detailSeqPart.do?partCode=$category&contentNum=$contentSeq'
  @GET('/detailSeqPart.do?partCode={category}&contentNum={contentSeq}')
  Future<PlaceDetailModel> getPlaceDetail({
    @Path() required String category,
    @Path() required int contentSeq,
  });
}
