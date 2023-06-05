import 'package:_dangtrip/Common/restaurant/model/restaurant_detail_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'restaurant_repository.g.dart';

@RestApi()
abstract class RestaurantRepository {
  //http://$ip/restaurant
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

//http://$ip/restaurant
  // @GET("/")
  // paginate();

//http://$ip/restaurant/:id
  @GET("/{id}") // 요청타입 대문자로  :id
  @Headers({
    "accessToken": "true",
  })
  Future<RestaurantDetailModel> getRestaurantDetail({
    //path에 대체할 변수를 지정, 이름이 다르다면 @Path 안에 어떤 젼수를 지정할지 표기
    @Path("id") required String id,
  });
}