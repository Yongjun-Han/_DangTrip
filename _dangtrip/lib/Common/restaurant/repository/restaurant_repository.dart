import 'package:_dangtrip/Common/const/data.dart';
import 'package:_dangtrip/Common/model/cursor_pagination_model.dart';
import 'package:_dangtrip/Common/model/pagination_params.dart';
import 'package:_dangtrip/Common/restaurant/dio/dio.dart';
import 'package:_dangtrip/Common/restaurant/model/restaurant_detail_model.dart';
import 'package:_dangtrip/Common/restaurant/model/restaurant_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
part 'restaurant_repository.g.dart';

final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  final dio = ref.watch(dioProvider);

  final repository =
      RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant');
  return repository;
});

@RestApi()
abstract class RestaurantRepository {
  //http://$ip/restaurant
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

//http://$ip/restaurant
  @GET("/")
  @Headers({
    "accessToken": "true",
  })
  Future<CursorPagintion<RestaurantModel>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });

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
