import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:heytea_kit/entity/response/responses.dart';
import 'package:heytea_kit/exception/api_exception.dart';
import 'package:heytea_kit/http/dio_interceptors.dart';
import 'package:heytea_kit/logger.dart';
import 'package:heytea_kit/toast.dart';
import 'package:heytea_kit/utils/error_utils.dart';

class Dior {
  static final appDio = _newDioInstance();

  static Dio _newDioInstance() {
    String platformType;
    try {
      platformType = Platform.operatingSystem;
    } catch (error) {
      // 默认是web啦
      platformType = "web";
    }

    final options = BaseOptions(
      baseUrl: null,
      connectTimeout: const Duration(seconds: 30).inMilliseconds,
      contentType: Headers.jsonContentType,
      receiveDataWhenStatusError: false,
      receiveTimeout: const Duration(seconds: 30).inMilliseconds,
      responseType: ResponseType.json,
    );

    final dio = Dio(options);
    dio.interceptors.add(TokenInterceptor());
    // 开启请求日志
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    // A dio transformer especially for flutter, by which the json decoding will be in background with [compute] function.
    dio.transformer = FlutterTransformer();
    dio.options.headers["version"] = 666;
    dio.options.headers["platformType"] = platformType;

    return dio;
  }

  /// 校验返回码是否正确
  static BaseResponse verifyResponse(BaseResponse response) {
    if (!response.isSuccess()) {
      final messageBuffer = StringBuffer();
      for (final line in response.desc) {
        messageBuffer.writeln(line);
      }
      throw HeyTeaAPIException(
        response.code,
        message: messageBuffer.toString(),
      );
    }

    return response;
  }

  /// 一般场景下处理异常的逻辑
  static void handleError(Object obj) {
    HeyTeaLogger().e(obj);

    final errMessage = ErrorUtils.messageFrom(obj);
    HeyTeaToast.showFailure(errMessage);
  }

  static String returnHandleError(Object obj) {
    HeyTeaLogger().e(obj);

    return ErrorUtils.messageFrom(obj);
  }

  /// 转换返回数据为一个本地模型
  static List<R> transformDataAsList<R>(
      BaseResponse response, FutureOr<R> onValue(Map<String, dynamic> json)) {
    final dataList = response.data as List;
    final modelList = List<R>(dataList.length);

    for (int i = 0; i < dataList.length; i++) {
      final data = dataList[i];
      final model = onValue(data);
      modelList[i] = model;
    }

    return modelList;
  }
}
