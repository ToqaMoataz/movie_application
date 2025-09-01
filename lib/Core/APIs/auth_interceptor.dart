import 'package:dio/dio.dart';


class AuthInterceptor implements Interceptor{
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers.addAll({"x-api-key" : Constants.apiKey});
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

}