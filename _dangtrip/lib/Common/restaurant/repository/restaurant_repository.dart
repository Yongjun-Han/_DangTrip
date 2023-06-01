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

  @GET("/{id}") // == :id
  @Headers({
    "authorization":
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3RAY29kZWZhY3RvcnkuYWkiLCJzdWIiOiJmNTViMzJkMi00ZDY4LTRjMWUtYTNjYS1kYTlkN2QwZDkyZTUiLCJ0eXBlIjoiYWNjZXNzIiwiaWF0IjoxNjg1NjE4MjQyLCJleHAiOjE2ODU2MTg1NDJ9.b1co-99WL7Q_IvGPDO7fTW1bVsbrmYbC1R4YEkZKPvA"
  })
  Future<RestaurantDetailModel> getRestaurantDetail({
    //path에 대체할 변수를 지정, 이름이 다르다면 @Path 안에 어떤 젼수를 지정할지 표기
    @Path("id") required String id,
  });
}
