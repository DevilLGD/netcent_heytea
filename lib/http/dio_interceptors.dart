import 'package:dio/dio.dart';
import 'package:heytea_kit/heytea_kit.dart';

/// 在此处改造请求，统一加入Token
class TokenInterceptor extends Interceptor { //
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final baseUrls = await HeyTeaKit.config?.apiBaseUrlsGetter();
    final isBaseUrl = baseUrls?.contains(options.baseUrl) == true;
    if (isBaseUrl) {
      if (options.headers == null) {
        options.headers = {};
      }

      final headers = options.headers;
      if (headers is Map) {
        final token = await HeyTeaKit.config?.apiTokenGenerator();
        headers.putIfAbsent("token", () => token);
      }
    }

    return super.onRequest(options, handler);
  }
}
