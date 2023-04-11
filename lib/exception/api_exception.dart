import 'dart:ffi';

import 'package:dio/dio.dart';

class HeyTeaAPIException implements Exception {

  final int code;
  final String message;

  const HeyTeaAPIException(this.code, {this.message = ""});

  HeyTeaAPIException.fromDioError(DioError dioError) : this(
      dioError.error is int ? (dioError.error as int) : -1,
      message: dioError.toString()
  );

  @override
  String toString() {
    return "WxApiException [code]: $code, [message]: $message";
  }
}