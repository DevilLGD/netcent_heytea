import 'package:dio/dio.dart';
import 'package:heytea_kit/heytea_kit.dart';

/// 在此处改造请求，统一加入Token
class TokenInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    final isBaseUrl =
        HeyTeaKit.config?.apiBaseUrls?.contains(options.baseUrl) == true;
    if (isBaseUrl) {
      if (options.headers == null) {
        options.headers = {};
      }

      final headers = options.headers;
      if (headers is Map) {
        headers.putIfAbsent("token", HeyTeaKit.config.apiTokenGenerator);
      }
    }

    return super.onRequest(options);
  }
}
