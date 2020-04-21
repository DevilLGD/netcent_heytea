import 'package:dio/dio.dart';
import 'package:heytea_kit/exception/api_exception.dart';
import 'package:heytea_kit/http/dio_error.dart';

class ErrorUtils {
  static String messageFrom(Object error) {
    String message;

    switch (error.runtimeType) {
      case DioError:
        final dioError = error as DioError;
        message = dioError.toDisplayText();
        break;
      case HeyTeaAPIException:
        final apiException = error as HeyTeaAPIException;
        message = apiException.message;
        break;
      default:
        message = error.toString();
    }

    return message ?? "";
  }
}
