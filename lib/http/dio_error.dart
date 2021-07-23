import 'package:dio/dio.dart';

extension HeyTeaDioError on DioError {

  String toDisplayText() {
    switch (type) {
      case DioErrorType.connectTimeout:
        return "连接超时";
      case DioErrorType.sendTimeout:
        return "发送超时";
      case DioErrorType.receiveTimeout:
        return "响应超时";
      case DioErrorType.response:
        switch (response?.statusCode) {
          case 400:
            return "400 Bad Request";
          case 401:
            return "401 Unauthorized";
          case 403:
            return "403 Forbidden";
          case 404:
            return "404 Not Found";
          case 405:
            return "405 Method Not Allowed";
          case 406:
            return "406 Not Acceptable";
          case 408:
            return "408 Request Timeout";
          case 421:
            return "421 Too Many Connections";
          case 451:
            return "451 Unavailable For Legal Reasons";
          case 500:
            return "500 Internal Server Error";
          case 501:
            return "501 Not Implemented";
          case 502:
            return "502 Bad Gateway";
          case 503:
            return "503 Service Unavailable";
          case 504:
            return "504 Gateway Timeout";
        }
        return "请求错误";
      case DioErrorType.cancel:
        return "请求已取消";
      case DioErrorType.other:
        return "网络异常";
      default:
        return "网络异常";
    }
  }
}