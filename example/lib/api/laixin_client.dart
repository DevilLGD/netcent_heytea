//import 'package:dio/dio.dart';
//import 'package:heytea_kit/entity/response/responses.dart';
//import 'package:heytea_kit/http/dior.dart';
//import 'package:json_annotation/json_annotation.dart';
//import 'package:retrofit/retrofit.dart';
//
//import 'api_const.dart';
//
//part 'laixin_client.g.dart';
//
//@RestApi(baseUrl: APIConst.laixinBaseUrl)
//abstract class LaixinClient {
//  static final _cache = <Dio, LaixinClient>{};
//
//  static LaixinClient shared() => LaixinClient(Dior.appDio);
//
//  factory LaixinClient(Dio dio) {
//    return _cache.putIfAbsent(dio, () => _LaixinClient(dio));
//  }
//
//  @GET("/appserver/advertising/openingAd")
//  Future<BaseResponse> openingAd(@Query('userId') int userId);
//}
