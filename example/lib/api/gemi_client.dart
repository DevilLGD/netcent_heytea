//import 'package:dio/dio.dart';
//import 'package:heytea_kit/entity/response/responses.dart';
//import 'package:heytea_kit/http/dior.dart';
//import 'package:json_annotation/json_annotation.dart';
//import 'package:retrofit/retrofit.dart';
//
//import '../entity/request/video_list_request.dart';
//import 'api_const.dart';
//
//part 'gemi_client.g.dart';
//
//@RestApi(baseUrl: APIConst.gemiBaseUrl)
//abstract class GemiClient {
//  static final _cache = <Dio, GemiClient>{};
//
//  static GemiClient shared() => GemiClient(Dior.appDio);
//
//  factory GemiClient(Dio dio) {
//    return _cache.putIfAbsent(dio, () => _GemiClient(dio));
//  }
//
//  @POST("/video/list")
//  Future<BaseResponse> videoList(@Body() VideoListRequest request);
//}
