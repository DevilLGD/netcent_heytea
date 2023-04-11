import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
//import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:flutter/foundation.dart';
import 'package:heytea_kit/entity/response/responses.dart';
import 'package:heytea_kit/exception/api_exception.dart';
import 'package:heytea_kit/heytea_kit.dart';
import 'package:heytea_kit/http/dio_interceptors.dart';
import 'package:heytea_kit/logger.dart';
import 'package:heytea_kit/toast.dart';
import 'package:heytea_kit/utils/error_utils.dart';

class Dior {
  static final appDio = newDioInstance();

  static Dio newDioInstance({
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 30),
    String baseUrl = "",
    ResponseType responseType = ResponseType.json,
    //String contentType = Headers.jsonContentType,
    bool receiveDataWhenStatusError = false
  }) {
    String platformType;
    if (kIsWeb) {
      platformType = "web";
    } else {
      platformType = Platform.operatingSystem;
    }

    final options = BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      baseUrl: baseUrl,
      responseType: responseType,
      //contentType: contentType,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
    );

    final dio = Dio(options);
    dio.interceptors.add(TokenInterceptor());
    // 开启请求日志
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    // A dio transformer especially for flutter, by which the json decoding will be in background with [compute] function.
    //dio.transformer = FlutterTransformer();
    dio.options.headers["version"] = HeyTeaKit.config?.appVersionCodeGetter();
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
  static void handleError(dynamic error) {
    HeyTeaLogger().e(error);
    HeyTeaToast.showError(error);
  }

  static String returnHandleError(Object error) {
    HeyTeaLogger().e(error);
    return ErrorUtils.messageFrom(error);
  }

  /// 转换返回数据为一个本地模型
  static List<R> transformDataAsList<R>(BaseResponse response,
      R onValue(Map<String, dynamic> json)) { //FutureOr<R>
    final dataList = response.data as List;
    //final modelList = List<R>(dataList.length);
    List<R> modelList = []; //List.filled(dataList.length, 0);

    for (int i = 0; i < dataList.length; i++) {
      final data = dataList[i];
      final model = onValue(data);
      modelList.add(model);
    }

    return modelList;
  }

  /// 转换返回数据为一个本地模型
  static List<R> transformDataList<R>(List data,
      R onValue(Map<String, dynamic> json)) { //FutureOr<R>
    final dataList = data as List;
    //final modelList = List<R>(dataList.length);
    List<R> modelList = [];

    for (int i = 0; i < dataList.length; i++) {
      final data = dataList[i];
      final model = onValue(data);
      modelList.add(model);
    }

    return modelList;
  }
}
