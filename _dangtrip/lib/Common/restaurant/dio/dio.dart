import 'package:_dangtrip/Common/const/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioIntercepter extends Interceptor {
  final FlutterSecureStorage storage;

  DioIntercepter({
    required this.storage,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("REQ ${options.method} ${options.uri}");

    // 만약 요청의 헤더에 true 값이 있다면
    if (options.headers['accessToken'] == "true") {
      //기존 true 값 제거후
      options.headers.remove('accessToken');
      //엑세스 토큰으로 값 대치
      final token = await storage.read(key: ACCESS_TOKEN_KEY);
      options.headers.addAll({
        'authorization': 'Bearer $token',
      });
    }

    if (options.headers['refreshToken'] == "true") {
      //기존 true 값 제거후
      options.headers.remove('refreshToken');
      //엑세스 토큰으로 값 대치
      final token = await storage.read(key: REFRESH_TOKEN_KEY);
      options.headers.addAll({
        'authorization': 'Bearer $token',
      });
    }
    // 실제로 요청이 보내지는 순간은 return 할때 handler 에 의해 결정
    return super.onRequest(options, handler);
  }

  //에러 발생시 onError
  //401 에러가 낫을때 토큰을 재발급 받아서 다시 새로운 요청으로 보낸다 .
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    print("ERROR ${err.requestOptions.method} ${err.requestOptions.uri}");

    final refreshToken = storage.read(key: REFRESH_TOKEN_KEY);
    //만약 리프레쉬 토큰이 없다면 에러발생
    if (refreshToken == null) {
      return handler.reject(err); //dio의 규칙
    }
    //401 에러 발생시 true
    final isStatus401 = err.response?.statusCode == 401;
    //에러가 발생한 url
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    //만약 토큰을 새로 발급받는 요청이 아니였다면
    if (isStatus401 && !isPathRefresh) {
      final dio = Dio();
      try {
        final res = await dio.post(
          "http://$ip/auth/token",
          options: Options(headers: {
            'authorization': "Bearer $refreshToken",
          }),
        );
        //새로 발급 받은 토큰키
        final accessToken = res.data['accessToken'];

        //에러를 발생시킨 모든 요청옵션
        final options = err.requestOptions;
        //엑세스 토큰값 대치
        options.headers.addAll({
          'authorization': 'Bearer $accessToken',
        });
        //여기에서 새로 발급받은 키는 해당 요청에만 적용되므로 storage에도 적용해주어야 한다
        await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
        //대치된 토큰 값으로 다시 요청
        final response = await dio.fetch(options);
        //에러요청을 가로 채서 에러를 해결해서 마치 에러가 없엇던것 처럼 재요청
        return handler.resolve(response);
      } on DioError catch (err) {
        return handler.reject(err);
      }
    }
    //토큰과 관련된 에러가 아니라면 reject
    return handler.reject(err);
  }
}
