import 'package:_dangtrip/Common/const/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  CustomInterceptor({
    required this.storage,
  });

  //요청을 보낼때
  //만약 요펑헤더에 ['accessToken'] == 'true' 이면 실제 토큰 으로 대치
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // print("[REQ] [${options.method}] ${options.uri}");

    if (options.headers['accessToken'] == 'true') {
      //true 값 삭제후 실 토큰 대치
      options.headers.remove('accessToken');
      final token = await storage.read(key: ACCESS_TOKEN_KEY);
      options.headers.addAll({'authorization': 'Bearer $token'});
    }

    if (options.headers['refreshToken'] == 'true') {
      //true 값 삭제후 실 토큰 대치
      options.headers.remove('accessToken');
      final token = await storage.read(key: REFRESH_TOKEN_KEY);
      options.headers.addAll({'authorization': 'Bearer $token'});
    }

    return super.onRequest(options, handler);
  }

  //응답을 받을때
  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   print(
  //       "[RES] [${response.requestOptions.method}] ${response.requestOptions.uri}");
  //   return super.onResponse(response, handler);
  // }

  //에러가 있을때
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    //401 에러 토큰 문제가 생겼을때
    //토큰을 재발급 받고 새로운 토큰으로 재용청 한다
    print("[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}");
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    //refresh 토큰이 없으면 에러 반환
    if (refreshToken == null) {
      return handler.reject(err);
    }
    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    if (isStatus401 && !isPathRefresh) {
      final dio = Dio();
      try {
        final res = await dio.post(
          'http://$ip/auth/token',
          options: Options(
            headers: {
              'authorization': 'Bearer $refreshToken',
            },
          ),
        );
        final accessToken = res.data['accessToken'];
        //에러가 발생한 모든 요청 관련 정보
        final options = err.requestOptions;

        options.headers.addAll({
          'authorization': 'Bearer $accessToken',
        });

        //새로 발급받은 토큰키를 유요한 키로 변경
        await storage.write(
          key: ACCESS_TOKEN_KEY,
          value: accessToken,
        );
        //토큰 문제를 해결한 뒤 다시 요청
        final response = await dio.fetch(options);
        return handler.resolve(response);
      } on DioError catch (e) {
        return handler.reject(e);
      }
    }

    return super.onError(err, handler);
  }
}
